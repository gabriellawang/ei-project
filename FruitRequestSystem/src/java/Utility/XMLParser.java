package Utility;

import Model.Vendor;
import Model.Package;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;


public class XMLParser extends DefaultHandler {
    String tmpValue;
    String xmlStr;
    //String ns = "ns:";
    String ns = "";
    Package pkg;
    Vendor vdr;
    ArrayList<Vendor> vList;
    
    
    public XMLParser(String xmlStr) {
        this.xmlStr = xmlStr;
        vList = new ArrayList<>();
        parseDocument();
        
    }
    public ArrayList<Vendor> getParsingResult(){
        return vList;
    }
    private void parseDocument() {
        // parse
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            SAXParser parser = factory.newSAXParser();
            parser.parse(new ByteArrayInputStream(xmlStr.getBytes(StandardCharsets.UTF_8)), this);
        } catch (ParserConfigurationException e) {
            System.out.println("ParserConfig error");
        } catch (SAXException e) {
            System.out.println("SAXException : xml not well formed");
        } catch (IOException e) {
            System.out.println("IO error");
        }
    }

    @Override
    public void startElement(String s, String s1, String elementName, Attributes attributes) throws SAXException {
        // if current element is book , create new book
        // clear tmpValue on start of element
        if (elementName.equalsIgnoreCase(ns+"vendor")) {
            vdr = new Vendor();
            vdr.addPkg(pkg);
        }
        if (elementName.equalsIgnoreCase(ns+"packages")) {
            pkg = new Package();
        }
 

    }
    @Override
    public void endElement(String s, String s1, String element) throws SAXException {
        // if end of book element add to list
        if (element.equals(ns+"vendor")) {
            vList.add(vdr);
        }
        if (element.equals(ns+"packages")) {
            vdr.addPkg(pkg);
        }
        // if current element is publisher
        if (element.equalsIgnoreCase(ns+"vendor")) {
            vdr.setName(tmpValue);
        }
        if (element.equalsIgnoreCase(ns+"package_name")) {
            pkg.setName(tmpValue);
        }
        if (element.equalsIgnoreCase(ns+"package_detail")) {
            pkg.setDescription(tmpValue);
        }
        if (element.equalsIgnoreCase(ns+"package_price")) {
            pkg.setPrice(Double.parseDouble(tmpValue));
        }
    }
    @Override
    public void characters(char[] ac, int i, int j) throws SAXException {
        tmpValue = new String(ac, i, j);
    }

}
