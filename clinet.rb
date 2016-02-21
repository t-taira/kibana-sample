require 'rubygems'
require 'couchbase'

c = Couchbase.connect("http://localhost:8091/pools/default/buckets/default")
c.set("foo", "bar")
c.append("foo", "!")
c.prepend("foo", "Hello, ")
c.get("foo")               
