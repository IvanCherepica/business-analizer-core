import model.BizType;
import service.BizTypeServiceImpl;

public class Main {

    public static void main(String[] args) {

        BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

//        BizType bizType1 = new BizType("кафе, рестораны");
//        bizTypeService.save(bizType1);
//
//        BizType bizType2 = new BizType("аптека");
//        bizTypeService.save(bizType2);
//
//        BizType bizType3 = new BizType("салоны красоты, барбер шоп, парикмахерские, спа, маникюр, студия красоты, солярии");
//        bizTypeService.save(bizType3);
//
//        BizType bizType4 = new BizType("магазины продукты");
//        bizTypeService.save(bizType4);
//
//        BizType bizType5 = new BizType("одежда");
//        bizTypeService.save(bizType5);
        int bizTypeId = 1;

        String bizType = bizTypeService.get(bizTypeId).getName();

        System.out.println(bizType);

    }

}
