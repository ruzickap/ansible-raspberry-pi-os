# https://github.com/shantanoo-desai/komponist/blob/main/filter_plugins/mosquitto_passwd.py
import base64
import hashlib

SALT_SIZE = 12
ITERATIONS = 101


def mosquitto_passwd(passwd, salt_seed):
    # Salt derived from salt_seed (e.g. user name) so the output is stable
    salt = hashlib.sha256(str(salt_seed).encode()).digest()[:SALT_SIZE]
    digest = hashlib.pbkdf2_hmac("sha512", str(passwd).encode(), salt, ITERATIONS)
    return "$7${}${}${}".format(
        ITERATIONS,
        base64.b64encode(salt).decode(),
        base64.b64encode(digest).decode(),
    )


class FilterModule(object):
    def filters(self):
        return {
            "mosquitto_passwd": mosquitto_passwd,
        }


if __name__ == "__main__":
    # Self-check: python3 mosquitto_passwd.py
    h = mosquitto_passwd("pw", "user")
    _, ver, rounds, salt, digest = h.split("$")
    ok = (ver, rounds) == ("7", "101") and len(salt) == 16
    ok = ok and len(digest) == 88 and digest.endswith("==")
    ok = ok and h == mosquitto_passwd("pw", "user") != mosquitto_passwd("pw", "other")
    if not ok:
        raise SystemExit("mosquitto_passwd self-check failed: " + h)
