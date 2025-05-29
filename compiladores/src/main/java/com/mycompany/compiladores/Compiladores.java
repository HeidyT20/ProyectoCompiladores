/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.compiladores;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tojhe
 */
public class Compiladores {

    public static void main(String[] args) {
        try {
            
            Reader r = new FileReader("prueba.txt");
            AnalizadorLexico al = new AnalizadorLexico(r);
            parser p = new parser(al);
            
            p.parse();
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Compiladores.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Compiladores.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Compiladores.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}




