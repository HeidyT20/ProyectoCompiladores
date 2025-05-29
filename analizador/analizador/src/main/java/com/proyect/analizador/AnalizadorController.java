package com.proyect.analizador;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.StringReader;

@RestController
@RequestMapping("/analizador")
@CrossOrigin(origins = "*")
public class AnalizadorController {

    @PostMapping("/analizar")
    public ResponseEntity<String> analizar(@RequestBody String codigo) {
        try {
            AnalizadorLexico lexico = new AnalizadorLexico(new StringReader(codigo));
            parser parser = new parser(lexico);
            parser.parse(); // Realiza el análisis

            return ResponseEntity.ok("Análisis exitoso.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error en el análisis: " + e.getMessage());
        }
    }
}

