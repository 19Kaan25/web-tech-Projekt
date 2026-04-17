package htw.webtech.projektname.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DemoController {
    @GetMapping("/demo")
    public List<Demo> demo() {
        return List.of(
                new Demo("Pavel", 27),
                new Demo("Max", 21),
                new Demo("Lisa", 23)
        );

    }
}
