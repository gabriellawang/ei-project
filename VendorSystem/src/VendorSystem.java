import java.util.*;
import java.io.*;
import java.sql.*;
import javax.jms.*;
public class VendorSystem implements ExceptionListener {
    /*-----------------------------------------------------------------------
     * Parameters
     *----------------------------------------------------------------------*/

    String serverUrl = null;
    String userName = null;
    String password = null;
    String name = "topic.sample";
    boolean useTopic = true;

    /*-----------------------------------------------------------------------
    * Variables
    *----------------------------------------------------------------------*/
    javax.jms.Connection connection = null;
    Session session = null;
    MessageConsumer msgConsumer = null;
    Destination destination = null;

    public VendorSystem(String[] args) {
        parseArgs(args);

        try {
            tibjmsUtilities.initSSLParams(serverUrl, args);
        }
        catch (JMSSecurityException e) {
            System.err.println("JMSSecurityException: " + e.getMessage() + ", provider=" + e.getErrorCode());
            e.printStackTrace();
            System.exit(0);
        }

        /* print parameters */
        System.err.println("\n------------------------------------------------------------------------");
        System.err.println("Vendor System");
        System.err.println("------------------------------------------------------------------------");
        System.err.println("Server....................... " + ((serverUrl != null) ? serverUrl : "localhost"));
        System.err.println("User......................... " + ((userName != null) ? userName : "(null)"));
        System.err.println("Destination.................. " + name);
        System.err.println("------------------------------------------------------------------------\n");

        try {
            run();
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }


    /*-----------------------------------------------------------------------
     * usage
     *----------------------------------------------------------------------*/
    void usage() {
        System.err.println("\nUsage: tibjmsMsgConsumer [options] [ssl options]");
        System.err.println("");
        System.err.println("   where options are:");
        System.err.println("");
        System.err.println(" -server   <server URL> - EMS server URL, default is local server");
        System.err.println(" -user     <user name>  - user name, default is null");
        System.err.println(" -password <password>   - password, default is null");
        System.err.println(" -topic    <topic-name> - topic name, default is \"topic.sample\"");
        System.err.println(" -queue    <queue-name> - queue name, no default");
        System.err.println(" -help-ssl              - help on ssl parameters\n");
        System.exit(0);
    }

    /*-----------------------------------------------------------------------
     * parseArgs
     *----------------------------------------------------------------------*/
    void parseArgs(String[] args) {
        int i = 0;

        while (i < args.length) {
            if (args[i].compareTo("-server") == 0) {
                if ((i + 1) >= args.length) usage();
                serverUrl = args[i + 1];
                i += 2;
            } else if (args[i].compareTo("-topic") == 0) {
                if ((i + 1) >= args.length) usage();
                name = args[i + 1];
                i += 2;
            } else if (args[i].compareTo("-queue") == 0) {
                if ((i + 1) >= args.length) usage();
                name = args[i + 1];
                i += 2;
                useTopic = false;
            } else if (args[i].compareTo("-user") == 0) {
                if ((i + 1) >= args.length) usage();
                userName = args[i + 1];
                i += 2;
            } else if (args[i].compareTo("-password") == 0) {
                if ((i + 1) >= args.length) usage();
                password = args[i + 1];
                i += 2;
            } else if (args[i].compareTo("-help") == 0) {
                usage();
            } else if (args[i].compareTo("-help-ssl") == 0) {
                tibjmsUtilities.sslUsage();
            } else if (args[i].startsWith("-ssl")) {
                i += 2;
            } else {
                System.err.println("Unrecognized parameter: " + args[i]);
                usage();
            }
        }
    }


    /*---------------------------------------------------------------------
     * onException
     *---------------------------------------------------------------------*/
    public void onException(
            JMSException e) {
        /* print the connection exception status */
        System.err.println("CONNECTION EXCEPTION: " + e.getMessage());
    }

    /*-----------------------------------------------------------------------
     * run
     *----------------------------------------------------------------------*/
    void run()
            throws JMSException {
        Message msg = null;
        String msgType = "UNKNOWN";

        System.err.println("Subscribing to destination: " + name + "\n");

        ConnectionFactory factory = new com.tibco.tibjms.TibjmsConnectionFactory(serverUrl);

        /* create the connection */
        connection = factory.createConnection(userName, password);

        /* create the session */
        session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

        /* set the exception listener */
        connection.setExceptionListener(this);

        /* create the destination */
        if (useTopic)
            destination = session.createTopic(name);
        else
            destination = session.createQueue(name);

        /* create the consumer */
        msgConsumer = session.createConsumer(destination);

        /* start the connection */
        connection.start();

        while (true) {
            /* receive the message */
            msg = msgConsumer.receive();

            if (msg == null)
                break;
            onMessage(msg);     //karway
            //System.err.println("Received message: " + msg);
        }

        /* close the connection */
        connection.close();
    }

    /*-----------------------------------------------------------------------
     * main
     *----------------------------------------------------------------------*/
    public static void main(String[] args) {
        new VendorSystem(args);
    }

    // Handle the message when received.
    public void onMessage(Message message) {
        try {
            if ((message instanceof TextMessage) && (message.getJMSReplyTo() != null)) {
                TextMessage requestMessage = (TextMessage) message;
                System.out.println("\tTime:       " + System.currentTimeMillis() + " ms");
                System.out.println("\tMessage ID: " + requestMessage.getJMSMessageID());
                System.out.println("\tCorrel. ID: " + requestMessage.getJMSCorrelationID());
                System.out.println("\tReply to:   " + requestMessage.getJMSReplyTo());
                
                
                System.out.println("\nReceived request..........");
                System.out.println("Retrieving available vendor to deliver to: " + requestMessage.getText()+"\n");
                System.out.println("Current available vendors: ");
                System.out.println("---------------------------------------------");
                
                //System.out.println("\tContents:   " + requestMessage.getText());
              
                String unsortedList = retrieveVendorDetails(requestMessage.getText());

   
                // Prepare reply message and send reply message
                Destination replyDestination = message.getJMSReplyTo();
                MessageProducer replyProducer = session.createProducer(replyDestination);
                TextMessage replyMessage = session.createTextMessage();
                // Hardcoded the replyMessage to for this example.
                replyMessage.setText(unsortedList);
                replyMessage.setJMSCorrelationID(requestMessage.getJMSMessageID());
                // sending reply message.
                replyProducer.send(replyMessage);

                System.out.println("Sent to Fruit Request System for ordering!");
                //System.out.println("\tTime:       " + System.currentTimeMillis() + " ms");
                System.out.println("\tMessage ID: " + replyMessage.getJMSMessageID());
                System.out.println("\tCorrel. ID: " + replyMessage.getJMSCorrelationID());
                System.out.println("\tReply to:   " + replyMessage.getJMSReplyTo());
                //System.out.println("\tContents:   " + replyMessage.getText());
                System.out.println("\tDestination:" + replyMessage.getJMSDestination());
            } else {
                System.out.println("Invalid message detected");
                System.out.println("\tType:       " + message.getClass().getName());
                System.out.println("\tTime:       " + System.currentTimeMillis() + " ms");
                System.out.println("\tMessage ID: " + message.getJMSMessageID());
                System.out.println("\tCorrel. ID: " + message.getJMSCorrelationID());
                System.out.println("\tReply to:   " + message.getJMSReplyTo());

                message.setJMSCorrelationID(message.getJMSMessageID());
            }
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
    
    
    
    public String retrieveVendorDetails (String region) {

        
        String dbURL = "jdbc:mysql://localhost:3306/sys-ven";
        String userName = "root";
        String password = "";
        java.sql.Connection dbConn = null;
        ResultSet rs = null;
        ArrayList<String> nameList = new ArrayList<String>();
        
        
        String sql1 = "SELECT distinct m.vendor,name,description,price FROM menus m, deliveryscope s WHERE region like '" + region + "' and s.vendor=m.vendor";
        StringBuffer outputXML = new StringBuffer();

        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            dbConn = DriverManager.getConnection(dbURL, userName, password);
            
            Statement statement = dbConn.createStatement();
            if(statement.execute(sql1)){
                rs = statement.getResultSet();
            }
            
            while (rs.next()){
                String vendor_name = rs.getString(1);
                nameList.add(vendor_name);
                
            }
            
            for(String rName: nameList){
                String sql2 = "select name,description,price from menus where vendor = '"+rName +"'";
                //sql2 += rName;
                outputXML.append("<menu>");
                System.out.println(rName);
                outputXML.append("<vendor>" + rName + "</vendor>");
                if(statement.execute(sql2)){
                    rs = statement.getResultSet();
                }
                while(rs.next()){
                    outputXML.append("<packages>");
                    outputXML.append("<package_name>" + rs.getString(1) + "</package_name>");
                    outputXML.append("<package_detail>" + rs.getString(2) + "</package_detail>");
                    outputXML.append("<package_price>" + rs.getDouble(3) + "</package_price>");
                    outputXML.append("</packages>");
                }
                outputXML.append("</menu>");
                System.out.println("---------------------------------------------");
            }

            
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if (dbConn != null) {
                    dbConn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //System.out.println(outputXML.toString());
        return (outputXML.toString());  
    }
    
    
    
    
    
    
}
