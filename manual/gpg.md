# GPG

[GPG Homepage](https://www.gnupg.org/) introduction:

> GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications. A wealth of frontend applications and libraries are available.

Related links:

* Homepage: https://www.gnupg.org/
* Github Repository: https://github.com/gpg/gnupg

Computing Power가 증가함에 따라 현재 널리 사용되는 공개키 암호화 알고리즘인 RSA도 언젠가 쉽게 뚫릴 수 있다. 현재 2048 bits(617 자리 숫자) 수 이용한 암호화가 가장 널리 사용되고 있는데 컴퓨팅 파워가 많이 발전하면 더 큰 숫자의 암호화를 사용하도록 변경하거나 다른 암호화 방식을 써야한다. 즉, 암호화를 했다고 해서 영원히 안전한 것은 아니다. 미래에 언젠가 무력화될 수 있으니 암호화를 하더라도 안전한 저장소를 사용하자.

## Install GPG

Install:

```
# Mac OS X
$ brew install gpg2

#CentOS:
$ sudo yum install -y gpg2

# Ubuntu
$ sudo apt-get install -y gnupg
```

## Manage key

Generate Key:

```
$ gpg --generate-key
$ gpg --full-generate-key
```

* `-full-generate-key` 옵션을 사용하면 Key를 만들기 위한 여러가지 질문들을 볼 수 있다.
* 암호화 알고리즘(Deafult: `RSA`)
* Key size(1024 ~ 4096)
* Expire Date(Default: `0 = key does not expire`)

GPG로 키를 생성하면 관례적으로 아래와 같이 2가지 종류의 키 타입이 생성된다:

* Primary Key: Signing(서명)에 사용된다.
* Sub Key: Encryption(암호화)/Decryption(복호화)에 사용된다.

즉, Key는 4개가 생성된다:

* Public Primary Key
* Private Primary Key
* Public Sub Key
* Private Sub Key

List Keys:

```
gpg --list-keys
gpg --list-public-keys
gpg --list-secret-keys
```

* `pub`: Public Key
* `sub`: Sub Key
* `sec`: Private Key (Secret Key)
* `ssb`: Private Sub Key (Secret Sub Key)
* `uid`: User ID
* `[SC]`: Key가 Signing 과 Certificate 용도로 사용된다는 의미
* `[E]`: Key가 Encryption 용도로 사용된다는 의미
* `[expires: yyyy-mm-dd]`: Expire Date
* TRUST VALUES
    - `ultimate`, `full`, `marginal`, `never`, `undefined`, `expired`, `unknown` 순서로 신뢰도가 낮음

Edit Key:

```
$ gpg2 --edit-key <key id or user id>
```

위 명령을 실행하면 키의 내용을 수정할 수 있는 Prompt(`gpg>`)가 출력된다. 해당 Prompt에서 `help`를 입력하면 수행가능한 작업들의 목록을 확인할 수 있다.

GPG Public Key export:

```
$ gpg --export --armor <user name> > pub-key-file
```

위 명령에서 `-armor`옵션은 결과를 Base64 Encoded String으로 출력해주는데, 이 옵션이 없으면 사람이 읽을 수 없는 Binary OpenPGP Format으로 출력된다.

GPG Key Private Key export:

```
$ gpg --export-secret-keys --aormor <user name> > pri-key-file
```

GPG Public Key import:

```
$ gpg --import pub-key-file
```

GPG Private Key import:

```
$ gpg --import pri-key-file
```

## Encryption and Decryption using Public Key

GPG Key를 이용하여 파일이나 문자열 등을 암호화할 수 있다. 다른 사람에게 공유하기 위한 것으로 공유받는 사람의 Public Key를 이용해서 암호화하고, 공유받는 사람은 자신의 Private Key를 사용하여 복호화한다.

Required options for encryption:

* `-encrypt` or `e`: Encryption을 수행하기 위한 옵션
* `-recipient` or `r`: 어느 공개키를 사용하여 암호화할 것인지를 전달하기 위한 옵션

Optional options for encryption:

* `-armor`, `a`: ASCII Format으로 결과를 출력
* `-output`, `o`: Output filename

다른 사람에게 보낼 메시지를 암호화:

```
# Encrypt message and output result to "to-buddy.txt" file.
echo 'hey buddy' | gpg --encrypt --armor --recipient my-buddy > to-buddy.txt
# Below is same with above.
echo 'hey buddy' | gpg -ea --recipient my-buddy > to-buddy.txt
# "--output" option can be used instead of redirection(>).
echo 'hey buddy' | gpg -ea --recipient my-buddy --output to-buddy.txt
```

메시지를 받은 사람이 메시지를 복호화:

```
$ gpg --decrypt to-buddy.txt
```

Encrypt file:

```
$ gpg --encrypt <File to encrypt>
```

출력되는 암호문을 Base64 로 가공해서 ASCII Format으로 출력:

```
$ gpg --encrypt --armor <File to encrypt>
-----BEGIN PGP MESSAGE-----
Version: GnuPG v2

hQEMAzGqGvQfNcm6AQf+MytdC0VQHWVfwgstFyuLSzg5IJl84H0iImO5jiPxvkyz
rwklcwtpNXQRoHi2UXxgAoGx0L/u+Sh3zRFUFOwiI99gUw+fhjoxVH25hUahJAxN
O3eAh5C6PR+IDLccrD0laWt7m/Vquept668qYw/I68Vie4XUAclJCWvq+xJdeU2Z
giYlRdCPKoUVZfNw4qHZnBcHYHkRGzQTvvlj6meJ1F6J3UDhzuulzADLMWyNdTM3
0fMhL2tghTAdlicSvj6OG4PXGcF9aP2Xk5ZFfAYrKq0jqEDLMCf1itkteZsttLdz
/wKGEvapRJEsPFs1Ukuwujt7pmOEwDdBIu2eFd56jtJFAcS5psbfMufD8AXxbfF4
5um5nxYXyxD6jU7YA59E/l1ZPt6h2if6HSrLoOjq2Za8isOOdntT/8f9RqML50JL
NLBUlZ6k
=Pazz
-----END PGP MESSAGE-----
```

Decrypt file:

```
$ gpg [--decrypt] <File to decrypt>
```

## Sign using Private Key

Private Key를 사용하여 Encryption하는 것을 서명(Signing, Signature)이라고 한다.

Signature는 아래의 목적으로 사용된다:

* Authentication(인증)
* Integrity(무결성, 손상이 없음)
* Non-repudiation (부인방지)

공문 등과 같은 특정 문서를 배포할 때 비밀키로 서명하여 배포하면, 실제 내가 작성하여 서명한 공문임을 증명하고, 파일이 변조되지 않았음을 확인할 수 있다.

Sign:

```
$ cat message.txt
My ID: myloginid
My Password: mypassword123

$ gpg --sign --armor message.txt

$ ls -alh
total 2
-rw-r--r--   1 youngho  staff    44B Sep  1 16:52 message.txt
-rw-r--r--   1 youngho  staff   764B Sep  1 16:52 message.txt.asc

$ cat message.txt.asc
-----BEGIN PGP MESSAGE-----

owGbwMvMwMH4PLfwxAZR7kOMa2yTuHNTi4sT01P1SipK4n3/bvCtVPB0sVLIrczJ
T8/My0zhAgoEJBYXl+cXpYCEC6BsQyNjrk7GzSwMjBwMsmKKLAmJtTpd+RPCjhsX
tcLMZ2UCmcjAxSkAE2Eu5/5ns8WY4/W8CW6z2UQrrDY0BUy5sDyXV+bA2Wt3brk+
vXxuY9Ft9+0eTtVTvRlfztJ1b/fawarit/DW/dfPjqz19t5zW01xRrXHf0+OgscP
9q9PVKgvX+uXd3BpYAnXoosdr1zP/M2ocS7Su1Ecui4tcM76je03rXa66+pZNE8v
ddddZfldpDH8zBr+9pw0lqoDf+xWMJ54GNj5g5fRdo2n2sTHp74GPNEMLvyzpsRk
wQbhSz4BIVliS0K1KqOkjpzxWPCL+V+oRemuD9J9E6bpM3uce3ybWVxa6a3gRbkr
Ck476nq3p1buvVkWJKIYaC38+2nk2ua3cxqX75krs0FWlstkconU1Qb+x0pZfLtO
h9r+/fnOPvn2x2d9Eq95o4T087fyzFnlniBenG7rwORWLWH4q01Enb/MatL6PfoN
X+q9RWrkJWa4hfyUOvp56adZr9hOv9vufvBPX7OjgIub1aoNF378yj77N/blTE2B
4BWOM19/nnW6uuhmdFYZi0kQw457jU/YOGtebTnVZXV2ftissKMA
=jdY+
-----END PGP MESSAGE-----
```

Decrypt signed file:

```
$ gpg --decrypt message.txt.asc
My ID: myloginid
My Password: mypassword123

gpg: Signature made Tue Sep  1 16:52:16 2020 KST
gpg:                using RSA key 60F..........BC2
gpg: Good signature from "imjang57 <imjang57@email.com>" [ultimate]
```

Verify Signature:

```
$ gpg --verify message.txt.asc
gpg: Signature made Tue Sep  1 16:52:16 2020 KST
gpg:                using RSA key 60F..........BC2
gpg: Good signature from "imjang57 <imjang57@email.com>" [ultimate]
```

Clear Sign:

```
$ gpg --clear-sign message.txt
$ cat message.txt.asc
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

My ID: myloginid
My Password: mypassword123
-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEYGF9LIpvkFbHM3KF521xyLAVC8IFAl9OALEACgkQ521xyLAV
C8LJGgv+Mf+XQg2oEjbp5PzchgXP0s4CFrGa4EfwlhzKJhEa6MjrGfT06Mx7CDGc
pUSpX6QePLlnVMeEHmiGzH+XpUgimtUVx6movhzDDFS6DQobW8kUwSTs6Eht6Jh/
kwJO+wZ4vF6dK9+J+d67290kIAtlE+Weq2PBta0XUYIjsgyZgdkJeokJ5TJRDj7I
6dwT/EWD/RwaUGhUh6ECgGS1OhKjz3cYhWcQFlEYZNRZ6/8wYIMjZTHx3ymEUSx5
8DVNxGY6QHSXbK6UNSJ2tkBj3D2T3oyQV0kyLotWmxdOdG1feNEY6VFSMmT+ikEv
oXr03FcmKTlpzbAwzLdEy3GuysA27Q+omgIy8RSVSf3x+1inzBbog7ldFyp7BfqR
fXJHdyriXCGsmuAwwxJrRqMUSMqdpsYpnIe2fk2l29uMk6dB+AP0L0MTFVIbiylw
xT291P8nGAf4fx8KZO/Qb/YPaIVxuAgQArMiGBQH1nhM1rs+/9mEL/tokNfQ78At
/1iXGiiy
=nT7F
-----END PGP SIGNATURE-----
```

Source file이 크다면 signature만 따로 생성해서 공유할 수도 있다. 그리고 verify를 통해 파일이 변경되었는지 여부를 확인할 수도 있다:

```
$ gpg --detach-sign --armor message.txt

$ gpg --verify message.txt.sig message.txt
gpg: Signature made Tue Sep  1 17:07:08 2020 KST
gpg:                using RSA key 60617D2C8A6F9056C7337285E76D71C8B0150BC2
gpg: Good signature from "youngho-jang19 <youngho.jang19@navercorp.com>" [ultimate]

$ echo "Modify message!" >> message.txt

$ cat message.txt
My ID: myloginid
My Password: mypassword123
Modify message!

$ gpg --verify message.txt.sig message.txt
gpg: Signature made Tue Sep  1 17:07:08 2020 KST
gpg:                using RSA key 60617D2C8A6F9056C7337285E76D71C8B0150BC2
gpg: BAD signature from "youngho-jang19 <youngho.jang19@navercorp.com>" [ultimate]
```

## References

* [GNUPG web site](https://www.gnupg.org/)
* [GnuPG 사용법](https://johngrib.github.io/wiki/gpg/)
