/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.algebra.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 *
 * @author 38595
 */
public class IconUtils {
    
      public static ImageIcon createIcon(File file, int width, int height) throws IOException {
        BufferedImage bufferedImage = ImageIO.read(file);
        Image image = bufferedImage.getScaledInstance(width, height,Image.SCALE_SMOOTH);
        return new ImageIcon(image);
      }
}