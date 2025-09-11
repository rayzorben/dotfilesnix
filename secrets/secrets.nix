let
  rayben = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjKda239tzwtWEM3Z17r2U6+TCak6zXX8CmU7fLJy/17NGfTF9RvfvoJQcme2CXRG41niTj27tLn/cWRI+dbslTpKX4GTxKc1DhrNLjRXv1Q2QkfCLJx6ny0TlzFf/Ti8xruErHx6ldHVNMQd9qqK4SG6KdUFmp9lntefJ+2EqNNi0Vjyj4QfM6mxu/uQSDsYReHyI6b62b+teckVKv+SCke0Ncm9HdQXbLmry+4Yz6RPcLFCjd3673p5pL0H2FNhx/xDRFmK61+c3hwmD9p4+iItKl+x4NhY0/qDYGIivRCpODicyV910kADVa+WlAs1EINUKr5ivjJx2OMC9lbiz rayben@raycachy";
in
{
  "secret1.age".publicKeys = [ rayben ];
  "armored-secret.age" = {
    publicKeys = [ rayben ];
    armor = true;
  };
}
