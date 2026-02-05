package com.chan.Items.Controllers;
import com.chan.Items.DTO.Items;
import com.chan.Items.ServiceLayer.JsonResponse;
import com.chan.Items.ServiceLayer.Logics;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/items")
public class MainController {
    Logics l1=new Logics();

    @PostMapping("/add")
    public JsonResponse addcontroller(@RequestBody Items i)
    {
        return l1.additems(i);
    }
    @GetMapping("/getitems")
    public Items getitemscontroller(@RequestBody Items i){
        return l1.getitems(i.getId());
    }
    @DeleteMapping(("/deleteitems"))
    public JsonResponse deletecontroller(){
        return l1.deleteitems();
  }
}
