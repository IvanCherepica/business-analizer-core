import jdk.nashorn.internal.parser.JSONParser;
import model.BizType;
import model.District;
import org.json.JSONArray;
import org.json.JSONObject;
import service.BizTypeServiceImpl;
import service.DistrictServiceImpl;

import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException {
//        String filePath = "C:\\Users\\Dell\\Desktop\\stepic_java_webserver-master\\business-analizer-core\\src\\main\\webapp\\SPB_districts.json";
//
//        FileInputStream fis = new FileInputStream(filePath);
//
//        InputStreamReader inputStreamReader  = new InputStreamReader(fis, "utf-8");
//        int i;
//        StringBuilder sb =new StringBuilder();
//
//        while ((i=inputStreamReader.read())!=-1){
//            sb.append((char) i);
//        }
//        String str = sb.toString();
//
//        JSONObject jsonObject = new JSONObject(str);
//        JSONArray arr = jsonObject.getJSONArray("districts");
//
////        System.out.println(arr.getJSONObject(1).getJSONObject("properties").getString("name"));
//
//        DistrictServiceImpl districtService = new DistrictServiceImpl();
//        for(int a = 0; a<arr.length(); a++){
//            District district = new District(arr.getJSONObject(a).getJSONObject("properties").getString("name"),
//                    arr.getJSONObject(a).getJSONObject("properties").getInt("population"),
//                    arr.getJSONObject(a).getJSONObject("properties").getDouble("area"),
//                    arr.getJSONObject(a).getJSONObject("geometry").get("coordinates").toString());
//            districtService.save(district);
//        }
//
//        System.out.println("done");
//        System.out.println(arr.getJSONObject(0).get("name"));
//        for(int b = 0; b<arr.length(); b++){
//////
//            JSONArray property= arr.getJSONObject(b).get("property");
//        }


//        JSONObject obj2 = new JSONObject("districts");
//
//
//        JSONArray arr = obj2.getJSONArray("districts");
//
//
//        System.out.println(arr.getJSONObject(1).toString());







//        BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();
//
////        BizType bizType1 = new BizType("кафе, рестораны");
////        bizTypeService.save(bizType1);
////
////        BizType bizType2 = new BizType("аптека");
////        bizTypeService.save(bizType2);
////
////        BizType bizType3 = new BizType("салоны красоты, барбер шоп, парикмахерские, спа, маникюр, студия красоты, солярии");
////        bizTypeService.save(bizType3);
////
////        BizType bizType4 = new BizType("магазины продукты");
////        bizTypeService.save(bizType4);
////
////        BizType bizType5 = new BizType("одежда");
////        bizTypeService.save(bizType5);
//        int bizTypeId = 1;
//
//        String bizType = bizTypeService.get(bizTypeId).getName();
//
//        System.out.println(bizType);



    }

}
