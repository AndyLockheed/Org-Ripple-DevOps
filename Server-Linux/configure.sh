
clear				# clear terminal window

echo "-------------------------------------------"
echo "Performing non-puppet configuration tasks"
echo "-------------------------------------------"

apt-get update
apt-get upgrade
apt-get install policykit-1

echo "-------------------------------------------"
echo "Installing Puppet"
echo "-------------------------------------------"

apt-get -y install puppet

echo "-------------------------------------------"
echo "Puppet apply commencing"
echo "-------------------------------------------"

puppet apply --modulepath /mnt/host/modules /mnt/host/manifests 
