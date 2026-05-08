package htw.webtech.studyhub.demo;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = {"http://localhost:5173", "https://studyhub-frontend-f45v.onrender.com"})
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
