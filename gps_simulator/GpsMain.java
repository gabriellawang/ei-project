import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import Model.Coordinate;
public class GpsMain{


	public static void main(String[] args) {
		try {
			ArrayList<Coordinate> cList = new ArrayList<Coordinate>();
            cList.add(new Coordinate(1.3688610, 103.8481050));
            cList.add(new Coordinate(1.3690542, 103.8496303));
            cList.add(new Coordinate(1.3607740, 103.8525300));
			cList.add(new Coordinate(1.3556511, 103.8567565));
			cList.add(new Coordinate(1.3140277, 103.8454995));
            cList.add(new Coordinate(1.3109685, 103.8447904));
            cList.add(new Coordinate(1.3109685, 103.8447904));
            cList.add(new Coordinate(1.3050089, 103.8509053));
            cList.add(new Coordinate(1.3034145, 103.8540131));
            cList.add(new Coordinate(1.3036374, 103.8529091));
            cList.add(new Coordinate(1.3018574, 103.8514160));
			
			for(int i = 0; i < cList.size(); i++){
				String content = cList.get(i).getX() + "," + cList.get(i).getY();
				File file = new File("test.csv");

				// if file doesnt exists, then create it
				if (!file.exists()) {
					file.createNewFile();
				}

				FileWriter fw = new FileWriter(file.getAbsoluteFile());
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(content);
				bw.close();

				System.out.println(content);
				System.out.println("Sending next coordinates in 30 sec...");
				Thread.sleep(5000); 
				}
		} catch (IOException e) {
			e.printStackTrace();
		}catch(InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}


}