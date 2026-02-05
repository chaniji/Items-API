package com.chan.Items.ServiceLayer;
import  java.util.ArrayList;
import com.chan.Items.DTO.Items;

public class Logics {
    private ArrayList<Items> items = new ArrayList<>();

    public JsonResponse additems(Items i) {
        if (idChecker(i.getId())) {
            return new JsonResponse("ID Already Exists");
        } else {
            items.add(new Items(i.getId(), i.getName(),i.getDescriptions(),"₹:".concat(i.getPrice())));
            return new JsonResponse("Item Successfully Added");
        }
    }
    public Items getitems(int id){
        for (Items i : items) {
            if (i.getId() == id) {
                return i;
            }

        }
        return new Items(0, "","NO ITEMS FOUNDED","");
    }
    public JsonResponse deleteitems(){
            items.clear();
            return new JsonResponse("Successfully deleted");
    }
    private Boolean idChecker(int id) {
        for (Items i : items) {
            if (i.getId() == id) {
                return true;
            }
        }
       return false;
    }
}







