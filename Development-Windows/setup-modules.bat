rmdir /Q /S modules
git clone https://github.com/chocolatey/puppet-chocolatey.git modules/chocolatey
git --git-dir=modules/chocolatey/.git --work-tree=modules/chocolatey checkout 37907065c7fc3863f81bafe07930322eedf472a9

git clone https://github.com/puppetlabs/puppetlabs-dism.git modules/dism
git --git-dir=modules/dism/.git --work-tree=modules/dism checkout 5a99a41a1f8baa362b4cc5387880e92677bcea80

git clone https://github.com/puppetlabs/puppetlabs-powershell modules/powershell
git --git-dir=modules/powershell/.git --work-tree=modules/powershell checkout 063200499ecf3bb5d6e007e2cefaa107c9611941

git clone https://github.com/puppetlabs/puppetlabs-reboot modules/reboot
git --git-dir=modules/reboot/.git --work-tree=modules/reboot checkout 9a658eb4dead0cde915818c588740a39ddeef4c2

git clone https://github.com/puppetlabs/puppetlabs-registry.git modules/registry
git --git-dir=modules/registry/.git --work-tree=modules/registry checkout 266de722b82c85e6ad29db63472df8a0836ffbe2

git clone https://github.com/puppetlabs/puppetlabs-stdlib.git modules/stdlib
git --git-dir=modules/stdlib/.git --work-tree=modules/stdlib checkout 05c6587d852800cc69e3a9381ff466ac3aa630d2

git clone https://github.com/puppetlabs/puppetlabs-vcsrepo.git modules/vcsrepo
git --git-dir=modules/vcsrepo/.git --work-tree=modules/vcsrepo checkout 56d55ee4426ddcbcf568d5b413ed780812738657

git clone https://github.com/badgerious/puppet-windows-env modules/windows-env
git --git-dir=modules/windows-env/.git --work-tree=modules/windows-env checkout 2d11f3021d08418670f913cc8f2da7a814c3d2c3

git clone https://github.com/liamjbennett/puppet-win_facts modules/win_facts
git --git-dir=modules/win_facts/.git --work-tree=modules/win_facts checkout e595877feef5f9698e0f5b4e2f627d16627b994e

git clone https://github.com/puppet-community/puppet-windows_firewall.git modules/windows_firewall
git --git-dir=modules/windows_firewall/.git --work-tree=modules/windows_firewall checkout 90c96de135f659fa419bd5e318c9a85660bdbbc5
