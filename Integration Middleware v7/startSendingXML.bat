CALL C:\tibco\ems\6.0\samples\java\setup.bat

javac EIXMLMsgProducer.java

rem # You need to change the server IP addr to the IP addr of where the EMS server is running
java EIXMLMsgProducer -server localhost -queue q.deliveryinfo

pause
