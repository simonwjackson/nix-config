let
  # simonwjackson = (builtins.readFile ../users/simonwjackson/id_rsa.pub);
  simonwjackson = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/PwyhdbVKd6jcG55m/1sUgEf0x3LUeS9H4EK5vk9PKhvDsjOQOISyR1LBmmXUFamkpFo2c84ZgPMj33qaPfOF0VfmF79vdAIDdDt5bmsTU6IbT7tGJ1ocpHDqhqbDO3693RdbTt1jTQN/eo3AKOfnrMouwBZPbPVqoWEhrLUvUTuTq7VQ+lUqWkvGs4D6D8UeIlG9VVgVhad3gCohYsjGdzgOUy0V4c8t3BuHrIE6//+6YVJ9VWK/ImSWmN8it5RIREDgdSYujs1Uod+ovr8AvaGFlFC9GuYMsj7xDYL1TgaWhy5ojk6JcuuF0cmoqffoW/apYdYM6Vxi5Xe6aJUhVyguZDovWcqRdPv2q0xtZn6xvNkoElEkrb6t0CAbGKf++H4h8/v5MsMt9wUPJAJBa24v0MlU8mXTUwhFLP5YQ/A8AAb5Y3ty/6DaOlvvTzt5Om2SMrZ1XaL1II35dFNZ/Os3zRpqdWq9SnpisRA+Bpf0bPUjdi8D8rRJn8g3zO5EsldBlZg82PiJcRHANbydTSK6Jzw7A8S5gMyPoH80Pq5MbQPvPpevTfOKy14NyTYPHGj0j5y7EQP7yb6w70LtqdRLRLQSTCdF0qTjVWw/qdt9MXkS7cdQe4yBADmjwozwPuxAs/jNpxELcVPEWBK6DcAIFD0vv3Xaw7reXpXFTQ==";

  users = [simonwjackson];

  fiji = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqiviW+vYBWWD/t9ZjdHMW4nSVmvjC8Qn2XfAAMG3YmEzTXfS7c3HEY0hQeDwfwdLhz7FwAT/mwDeqh7cNDz9wfJgffXKbHdIKINqSSHLAGIyue6AVBtYT3Dy4ERY6xnzbikbcC6c/qWp0zydZaL9DiWR6PTbgyT4gWwr7d4amLjoQ3Nyh0C1zujFRjt0jMXNeRK5ziIAVoA1jPjJLhgw9E5MhH2j0t02Usatmfwb9cX7G+VQksNTJ58NxhCdDDVuPR/yO2wDb3d5fI33dLXCskE411tRGJLFiRlbbLhiH7FBK6NqUDH29zYNjuzpceEGjuDsnLosriFxuuGXmzq0JwY6zBK3h7w+0FaPmGnZn0gMbqhFx1/8Y+3xkG1GCKUqPgVtaQgiL7+RmAq7npcLnaTG+bV4xicUT4lwbyWo9EhBTTvGgf8DOCaL3dnI6hH64uO0gR4n42KRTwPFnI2sEVRcQ5mD/WEJ6wHfBgOEaHRewwyvRJThNjmD1Xe1Xwbo2opX1Al3jbox6mkK5qEzZ2l2mhMVmspB36VpLb23FFDY58rzy+RkE5aHxw74OQiENHj7gWV0M8xHWkNHsSinVMg1SHZwVWmMuEqLfmX77exZgG1OS4QBJ3Qij8LK7k5o4zoAwPPPnsPv4cVsKX9cd2Zmn0CaHfSq2mXnElybA7Q==";
  # fiji = builtins.readFile ../nixos/hosts/fiji/ssh_host_rsa_key.pub;
  unzen = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCiolwn68oVfkmu9Mrv1Wl8DBYTb9x0n1byCm/DUuevE0ZT9mcCI5IKVyhmSqR+fm+3toPcnwewV4UgVuKBKMUk3eeKMF5CufqWj6Dt7Bv3pteDH/fVpF7qF0+lLU5cpBVH2q7c35F5y72tyUiaTgDyPwdhx79C6Q29TEDdRRpDyCp4GxaM0q1iwLX4GkF0tBrROx9Lt3ARyJPgDXXrVSQkQ3JTQu1MHgvyJ5fNc+BlPBZK+ip+hGGAXIaCM+Zm2c3BmdLBEs6lZQ1l707v8qcGVcxzQS0fx9TzAuzVE1syZM/NQBR0c5anNqIwhofkjSQKYmwrKvYl3gBeiLkFrjROgiChPQ1cthKWygkVwbtNX0kD2+4fKJXIiaWihfBTySoRct2LFxLUYGZKFun4swNr5rw9Q/CgxSu28zOo2BYJLkLAq+oA8oJyawpQ55I/4jmNNAEaer0A08ABbr+uHClc2w3r8N8c2TICHilBRCrajJkG6t8TYnLrbsdC+wCz6lP9Vf4Y4SkaOKIyjPE0OcgY+h4gi9sjPf+cl9EEdeSvehpWcex4FRt6DTyiO4wf8jdVrXCW85ALXLNRgB9NYfN2iTADFX+TopPxW+wP/7MA6yzcp7I40QzmghUczHZ9eCFfDbcSVB/TMsqqjPpkQxaf+vopphzDEz89o+tdrQPKTQ==";
  #unzen = builtins.readFile ../nixos/hosts/unzen/ssh_host_rsa_key.pub;
  rakku = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC36Bm7dtIEkyQZb4eVOgeFKiV6MA5JjC0DHFe8jH33mKPIdzQUsZ/yRb75+ZKatS4BMWLc/tMRmZH1bPdjruTkkAyqxtw6ImczIw7PuuCC0xQU1zx6SgK7tgNzB/sULXpPNw0oBT+Iu1RX84mYepw0PCr8wRBxZlQD69VhpBtyLdlxjqNNBwsWFWZ9S2/uTUxMIVX0t9gTo08KJ9Ai6xX9giveGDd3vRD/Z/F+s3i5MPBMT3Gn7MLFu2wEPi9QZ9NOONVTl0Nzr+P7ULz1zA53jh/xsegYZt8IYPDdTQqn4+rXUR5C3qYUmzoijSAnHbB5LrnbuvvKKXlarPSS1dw0WESThWa1/qpSGUe5aLCjTfabWzdvuDgW4MJ8T1anRCChDi/JqAG+hdRuijUDMQ3ngr+kLI7cBSVcKXEE6V71RgsIo6/BCJm+8T9WgNBcDbUFgK9OkorBgRhlwRM4hLQYXBCjToiUoH6dcDQU2clhd1pn4ZcNa6mWvLkPNCjOU1s525B+/cIcFxe7R3UDqFUsGICooXW4MUEqGMRQwUCGCUUrgFaiupxEVmLoz0xX6ANOQyjmA00gMDFw2IZVx7L8U7F6LAen61ohwMjbMYFOFaouwqz/TcnetHZGt0U3lPyJex1h41xx6HfTU7Z7wmXW5Af9WuTQp3Ltc7LiCB2HlQ==";
  # rakku = builtins.readFile ../nixos/hosts/rakku/ssh_host_rsa_key.pub;
  yabashi = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDn+qMqUNdRS0sX+W1zRCu7fnPKI3iJsaGZNN+5ouvAgysTSK2AcBDA7sFovPLN5KQ3CG8XR4BV+htF2mceqv7gtXQj1kNYQgxYVii5oCc2N9P3M2lj3gjGjUFyyTTnKqNMEtRZQMlgPmzrGbSWGFzTiQMQCFQZdwv0n+S/krlN8j1o305+csEs8qeAyKcVybfC//AVvL1v4Tg6ZnLlPJg3FauY/8Vsf3+5z4e2p2hYO6lpU9HUN/nr3uWCd79sFR/ryibYATwUeWmUqkfT0E1DJ/AExcg6PTHtZLXVdKo4ukmC7DtwGXa5wFjIbjKHE6YMXz9Y3336mzD5fJ0idMFuQGujvVGcHdqyse3+Z2qLjaG/V9tKJZimZV61FuBalLgkPt0j0uXuVgtWzWWx2FkFCErx06bgw4jh/t5UsunkfxE/JfOc/iJC+r7Wj6xPZkNn9BtwnZo/6sIq4a+7IOzrTfBbgL9osgb+6aHcHK8nQKfRRsyuMF0d9YZs1mvknms=";
  # yabashi = builtins.readFile ../nixos/hosts/yabashi/ssh_host_rsa_key.pub;
  zao = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+2bu1jg44vklG0Aq2/Whg1N2GI9kJzfowEYh8UHEgIBrW+/tHcHlSRrp54PHDDpLafQhVU9sZyH8ua1snL6qIhURfb8XPMlA7R/s3UQW9UupromsiJ08Gwu/CQANSij68o+ve+Fa+pWvI1KXK8NPduA+sC4AS8IFifCfj0e7pjmKYlkIoQjMAhXkQtV9LGyJOv3pMXR2sOrWsM3xRUXxQWB6ZueckAGaxJvmGaK3SFQn1Y+cJ7zFfU6vkDMo4/6MHpryzdlRaCOdRcI3fmGW8f7Y7nRblvfo37HL40QTaYsSezHr5gnt2PiUCb7N4tXcycXJ+LHN0l122Fk5hlOhnxT5IvEFUgxg8iAx7tOZJi7Mkm6klaXbzvE2czlUSm14dsiuU0BHDNu7+F1i/8Sn9vREgFi0iU3lFcKpRt2l6FkNxhRyFLKRhB7BZ4Oc8h/a98Y9TXEW4qlLXQlWzyWNDphZGAYQa5zYZjwML7J+AA8gH7jFnKAe7lcNc58RPRZGcugcGxcTctKK0hRC4TWhBiSDSlb2Neu7XjG0DpGgj+bUk5Gu3JdAGrlE3xzZ8reI1edBM0pJFYBwuCWhR/tbcSUv2xFiXnKZr2PzzSF6zU5klM49X+5nFEctA9wXf8gvafs0X3/JB6cgfw79uMvMk9RA9v0RoY636q16MBC1V+w==";
  # zao = builtins.readFile ../nixos/hosts/zao/ssh_host_rsa_key.pub;
  ushiro = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlS7mK1MSLJviO83iAxwE5FQOu6FU9IeY6qcj6qYZ1s8qevcgj94CKhLq/ud/TexZ3qWVHkidmX0idQ4eo10lCYhAMynxT4YbtXDvHzWeeAYVN9JGyBdl4+HNctzdIKDrdOZzu+MBKgXjshuSntMUIabe7Bes+5B75ppwWqANFNPMKUSqTENxvmZ6mHF+KdwOI1oXYvOHD5y3t1dtWWcLMrot6F/ZUae5L7sRp+PqykOV4snI06uTeUxs0cTZJULDwNgngqIG9qs72BCfVvuOOwYosezUoajikPzzbBOJBl6l3M7MSJQfilVgvT/gHAxJKuZ1RzrPrssYBCbVanEL6dXuhiI25yxQvIqxDJmLzI9hvVwGgJJzov9BduO+vvPX/AwMd1oLxScgISkK/y+6+VHz+ey88gVniw22mSG0ueG11eebtp9c/lmBpNxZ30gmaINbgxZn4sM99RtC3E8eJ+KmKet8L+tFtVdeCYB7pgk8k/h06s9s3r34TGJ+SmrU=";
  # ushiro = builtins.readFile ../nix-darwin/hosts/ushiro/ssh_host_rsa_key.pub;

  systems = [fiji unzen rakku yabashi zao ushiro];
in {
  "user-simonwjackson.age".publicKeys = users ++ systems;
  "user-simonwjackson-openai-api-key.age".publicKeys = users ++ systems;

  "aria2-rpc-secret.age".publicKeys = users ++ systems;
  "tailscale.age".publicKeys = users ++ systems;
  "tandoor_env.age".publicKeys = users ++ systems;
  "paperless_ngx_env.age".publicKeys = users ++ systems;
  "atuin_key.age".publicKeys = users ++ systems;
  "atuin_session.age".publicKeys = users ++ systems;

  "yabashi-syncthing-key.age".publicKeys = users ++ [yabashi];
  "yabashi-syncthing-cert.age".publicKeys = users ++ [yabashi];

  "unzen-syncthing-key.age".publicKeys = users ++ [unzen];
  "unzen-syncthing-cert.age".publicKeys = users ++ [unzen];

  "fiji-syncthing-key.age".publicKeys = users ++ [fiji];
  "fiji-syncthing-cert.age".publicKeys = users ++ [fiji];
}
