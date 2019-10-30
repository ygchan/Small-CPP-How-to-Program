# Install Cassandra

# Step 01. Download Java 
# https://www.oracle.com/technetwork/java/javase/downloads/jdk13-downloads-5672538.html

# Step 02. Download Cassandra
# http://www.apache.org/dyn/closer.lua/cassandra/3.11.4/apache-cassandra-3.11.4-bin.tar.gz
# Did not have curl or yam installed.

# Step 03. Download Python Client
# https://github.com/datastax/python-driver
# There are option to allow faster building (instead of 10+ minutes)

# Step 04. Download Spark
# https://spark.apache.org/examples.html

# Step 05. Cypher Query Language
# /usr/libexec/java_home -V
# export JAVA_HOME=`/usr/libexec/java_home -v 13`
# cd Downloads/neo4j-community-3.5.12
# ./bin/neo4j console
# http://localhost:7474/

# https://neo4j.com/developer/javascript/
# MATCH (nicole:Actor {name: 'Nicole Kidman'})-[:ACTED_IN]->(movie:Movie)
# WHERE movie.year < $yearParameter
# RETURN movie

# Step 06. Neo4j
from py2neo import Graph
from py2neo import *

graph = Graph("bolt://localhost:7687", auth=('neo4j', 'xyz'))
tx = graph.begin()

a = Node("Person", name="Alice")
b = Node("Person", name="Bob")
ab = Relationship(a, "KNOWS", b)
ab

# (Alice)-[:KNOWS {}]->(Bob)
