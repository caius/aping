# aping

aping is an average ping script. It wraps `ping` and prints out data as each ping is (or isn't) received.

## Usage

	aping <address>

## Example

	Julius:aping(master) caius$ ./build/Debug/aping google.com
	PING google.com (74.125.127.100): 56 data bytes
	64 bytes from 74.125.127.100: icmp_seq=0 ttl=49 time=193.129 ms
	64 bytes from 74.125.127.100: icmp_seq=1 ttl=49 time=187.329 ms
	64 bytes from 74.125.127.100: icmp_seq=2 ttl=49 time=271.651 ms
	64 bytes from 74.125.127.100: icmp_seq=3 ttl=49 time=285.301 ms
	64 bytes from 74.125.127.100: icmp_seq=4 ttl=49 time=275.630 ms
	64 bytes from 74.125.127.100: icmp_seq=5 ttl=49 time=245.522 ms
	64 bytes from 74.125.127.100: icmp_seq=6 ttl=49 time=190.020 ms
	64 bytes from 74.125.127.100: icmp_seq=7 ttl=49 time=230.764 ms
	64 bytes from 74.125.127.100: icmp_seq=8 ttl=49 time=224.335 ms
	64 bytes from 74.125.127.100: icmp_seq=9 ttl=49 time=223.009 ms
	64 bytes from 74.125.127.100: icmp_seq=10 ttl=49 time=215.395 ms
	64 bytes from 74.125.127.100: icmp_seq=11 ttl=49 time=185.624 ms
	64 bytes from 74.125.127.100: icmp_seq=12 ttl=49 time=190.114 ms
	64 bytes from 74.125.127.100: icmp_seq=13 ttl=49 time=306.613 ms
	64 bytes from 74.125.127.100: icmp_seq=14 ttl=49 time=310.030 ms
	64 bytes from 74.125.127.100: icmp_seq=15 ttl=49 time=187.502 ms
	64 bytes from 74.125.127.100: icmp_seq=16 ttl=49 time=247.679 ms
	64 bytes from 74.125.127.100: icmp_seq=17 ttl=49 time=234.007 ms
	64 bytes from 74.125.127.100: icmp_seq=18 ttl=49 time=307.930 ms
	19 sent, 19 received, 0.0% packet lossping: sendto: Network is down
	ping: sendto: No route to host
	ping: sendto: No route to host
	ping: sendto: No route to host
	ping: sendto: No route to host
	Request timeout for icmp_seq 19
	Request timeout for icmp_seq 20et loss
	Request timeout for icmp_seq 21et loss
	Request timeout for icmp_seq 22ket loss
	Request timeout for icmp_seq 23ket loss
	64 bytes from 74.125.127.100: icmp_seq=24 ttl=49 time=322.844 ms
	64 bytes from 74.125.127.100: icmp_seq=25 ttl=49 time=210.551 ms
	64 bytes from 74.125.127.100: icmp_seq=26 ttl=49 time=200.314 ms
	64 bytes from 74.125.127.100: icmp_seq=27 ttl=49 time=277.611 ms
	64 bytes from 74.125.127.100: icmp_seq=28 ttl=49 time=186.949 ms
	64 bytes from 74.125.127.100: icmp_seq=29 ttl=49 time=228.979 ms
	64 bytes from 74.125.127.100: icmp_seq=30 ttl=49 time=190.477 ms
	64 bytes from 74.125.127.100: icmp_seq=31 ttl=49 time=186.764 ms
	32 sent, 27 received, 15.6% packet loss^C
	--- google.com ping statistics ---
	32 packets transmitted, 27 packets received, 15.6% packet loss
	round-trip min/avg/max/stddev = 185.624/233.929/322.844/44.409 ms

## Licence

The MIT License

Copyright (c) 2009 Caius Durling <dev@caius.name>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
