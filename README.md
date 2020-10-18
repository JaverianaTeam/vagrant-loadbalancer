# vagrant-loadbalancer
Creating a Centos cluster environment using Vagrant along with Virtualbox

<p>This repository provides a template Vagrantfile to create a Centos cluster environment with a Master Node and N Worker Nodes, using the VirtualBox hypervisor on your local machine.</p>

### <h2>Setup</h2>

### Dependencies
<p>Before running the startup script, it is required that you install, on your local machine, the Vagrant and Virtualbox software. </p>

* [VirtualBox][virtualbox] 4.3.10 or greater.
* [Vagrant][vagrant] 1.6 or greater.


### Cloning the project from Github
```
git clone https://github.com/bmartinezm/vagrant-loadbalancer.git
```

### Configuration
The following table lists the configurable parameters of the [Vagrantfile](Vagrantfile) and their default values.

<table>
<thead>
<tr>
<th>Parameter</th>
<th>Description</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>centos_release</code></td>
<td>CentOS release</td>
<td><code>7</code></td>
</tr>
<tr>
<td><code>vm_gui</code></td>
<td>If this value is set to true, all CentOS VMs will include the GUI software</td>
<td><code>false</code></td>
</tr>
<tr>
<td><code>vm_size</code></td>
<td>It is the assigned Memory and CPU per instance.Be aware that the minimum memory and CPU per instance is  4096 MB and 2 vcpus</td>
<td><code>{"cpus" => 2, "memory" => 2048}</code></td>
</tr>
<tr>
<td><code>vm_name_mn</code></td>
<td>The Virtual Machine name for the cluster Master Node in Virtualbox</td>
<td><code>centos-lb-mnode</code></td>
</tr>
<tr>
<td><code>vm_hostname_mn</code></td>
<td>The server's hostname for the cluster Master Node</td>
<td><code>lb-masternode</code></td>
</tr>
<tr>
<td><code>vm_name_wn</code></td>
<td>The Virtual Machine name for the cluster Worker Nodes in Virtualbox</td>
<td><code>centos-lb-wnode</code></td>
</tr>
<tr>
<td><code>vm_hostname_wn</code></td>
<td>The servers' hostname for the cluster Worker Node</td>
<td><code>lb-workernode</code></td>
</tr>
<tr>
<td><code>N</code></td>
<td>Number of nodes worker nodes, TOTAL VMs: N+1</td>
<td><code>4</code></td>
</tr>
<td><code>vagrant_assets</code></td>
<td>It is the directory where the VMs' bootstrap scripts are stored</td>
<td><code>./vagrant</code></td>
</tr>
<tr>
<td><code>vm_net_mask</code></td>
<td>The environment subnet mask</td>
<td><code>"255.255.255.0"</code></td>
</tr>
<tr>
<td><code>vm_net_ip</code></td>
<td>The cluster environment's private subnet. Virtualbox's type of network: "host-only"</td>
<td><code>"192.168.200."</code></td>
</tr>
</tbody>
</table>


### Startup 
<p>A Bash script was created to startup easily the Vagrant project. Before running it, make sure that all software and hardware requirements are met.</p>

```
cd vagrant-loadbalancer
./startup.sh
```

### <h2>SSH Access</h2>
<p>The startup.sh script triggers the "vagrant up" command to pull the CentOS images (boxes), create the VMs, and download all necessary software to create a Centos cluster environment cluster. It also creates a ssh key pair to ssh the master and worker nodes. </p>

<h3>Master Node</h3>

```
ssh -i ssh-key vagrant@<vm_net_ip>.10
```
<h3>Worker Nodes</h3>

```
ssh -i ssh-key vagrant@<vm_net_ip>.1N
```

<p>Where <b>N</b> is the number of worker nodes. <b>If you do not change the default network configuration, you could access the servers as follows.</b></p>

<h3>Master node - Default net configuration</h3>

```
ssh -i ssh-key vagrant@192.168.200.10
```

<h3>Worker nodes - Default net configuration</h3>

```
ssh -i ssh-key vagrant@192.168.200.11
ssh -i ssh-key vagrant@192.168.200.12
ssh -i ssh-key vagrant@192.168.200.1N
```


### <h2>Removing the Centos cluster environment environment</h2>

<p>The shutdown script removes the Centos cluster environment environment created with the startup script.</p>

```
cd vagrant-loadbalancer
./shutdown.sh
```


[virtualbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/downloads.html

<h2>License</h2>

All the code in this repo is under ![picture](https://img.shields.io/badge/license-MIT-brightgreen)

```
MIT License

Copyright (c) 2020
JaverianaTeam


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```