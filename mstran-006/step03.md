## Objective
The objective of this lesson exercise the synchronous version of MOA *Fortune Cookies*.

## Steps

First, we need to install a gRPC client.

**Step 1:** Install the build tools

`cd ~/`{{execute T1}}

`apt-get install build-essential autoconf libtool pkg-config -y`{{execute T1}}

`apt-get install clang-5.0 libc++-dev`{{execute T1}}

`cd grpc`{{execute T1}}
 
`git submodule update --init`{{execute T1}}

`mkdir -p cmake/build`{{execute T1}}

`cd cmake/build`{{execute T1}}

`cmake -DgRPC_BUILD_TESTS=ON ../..`{{execute T1}}

`make grpc_cli`{{execute T1}}

---

***Next: Understanding the code***