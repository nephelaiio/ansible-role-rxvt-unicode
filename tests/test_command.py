from testinfra.utils.ansible_runner import AnsibleRunner


testinfra_hosts = \
    AnsibleRunner('.molecule/ansible_inventory').get_hosts('test')


def test_command(Command):
    assert Command('urxvt -h').rc == 1
    assert Command('xrdb -help').rc == 1
