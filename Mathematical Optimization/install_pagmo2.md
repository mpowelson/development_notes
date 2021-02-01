# Install Pagmo2

Specifically, I want to install it with Eigen, IPOPT, and NLopt support. Additionally, there are some fixes in master that I need, so I'm not pulling the release version

```
git clone git clone https://github.com/esa/pagmo2.git
cd pagmo2
mkdir build
cd build
cmake ..
cmake -LH
```

At this point you should see all of the build flags that need to be set and their current values. Assuming the names have not changed, update them like this

```
cmake .. -DPAGMO_WITH_EIGEN3=ON -DPAGMO_WITH_NLOPT=ON -DPAGMO_WITH_IPOPT=ON

```

Now simply build and install

```
make
sudo checkinstall
```


