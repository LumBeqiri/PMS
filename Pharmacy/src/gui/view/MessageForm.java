/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.view;

import bll.Product;
import bll.Stock;
import connection.Connect;
import dal.ProductRepository;
import dal.StockRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.joda.time.Months;

/**
 *
 * @author Adis Durguti
 */
public class MessageForm extends javax.swing.JInternalFrame {

    /**
     * Creates new form MessageForm
     */
    List<Stock> listStock;
    List<Product> listProduct;
    StockRepository sr = new StockRepository();
    ProductRepository pr = new ProductRepository();
    Connection connection = null;
    Connect con = new Connect();
    PreparedStatement pst = null;

    public MessageForm() {
        initComponents();
        quantityLabel.setVisible(false);
        mothnsLabel.setVisible(false);
        expiredLabel.setVisible(false);
        printStock();
        printProductNearByExpiryDate();
        printExpiredProducts();

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        msgArea = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        productsToExpire = new javax.swing.JTextArea();
        quantityLabel = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        expiredProductsArea = new javax.swing.JTextArea();
        mothnsLabel = new javax.swing.JLabel();
        expiredLabel = new javax.swing.JLabel();

        msgArea.setEditable(false);
        msgArea.setBackground(new java.awt.Color(240, 240, 240));
        msgArea.setColumns(20);
        msgArea.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        msgArea.setRows(5);
        msgArea.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        msgArea.setOpaque(false);
        msgArea.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                msgAreaFocusGained(evt);
            }
        });
        jScrollPane1.setViewportView(msgArea);

        productsToExpire.setEditable(false);
        productsToExpire.setBackground(new java.awt.Color(240, 240, 240));
        productsToExpire.setColumns(20);
        productsToExpire.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        productsToExpire.setRows(5);
        productsToExpire.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        productsToExpire.setOpaque(false);
        jScrollPane2.setViewportView(productsToExpire);

        quantityLabel.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        quantityLabel.setText("Product with Quantity below 20 !");

        expiredProductsArea.setEditable(false);
        expiredProductsArea.setBackground(new java.awt.Color(240, 240, 240));
        expiredProductsArea.setColumns(20);
        expiredProductsArea.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        expiredProductsArea.setRows(5);
        expiredProductsArea.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        expiredProductsArea.setOpaque(false);
        jScrollPane3.setViewportView(expiredProductsArea);

        mothnsLabel.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        mothnsLabel.setText("Products with Expiry Date less than 2 months ! ");

        expiredLabel.setFont(new java.awt.Font("Monospaced", 0, 18)); // NOI18N
        expiredLabel.setText("Expired Products !");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 1072, Short.MAX_VALUE)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 1072, Short.MAX_VALUE)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 1072, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(quantityLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 396, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(mothnsLabel)
                            .addComponent(expiredLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 506, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(quantityLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 219, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(mothnsLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 219, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25)
                .addComponent(expiredLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 219, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void msgAreaFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_msgAreaFocusGained
        // TODO add your handling code here:

    }//GEN-LAST:event_msgAreaFocusGained

    public void printStock() {

        try {
            String sql = "select stockName , quantity from Stock where quantity <= 20 order by quantity";
            connection = con.getConnect();
            pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                quantityLabel.setVisible(true);
                String stockName = rs.getString("stockName");
                int quantity = rs.getInt("quantity");
                msgArea.append(stockName + " : " + quantity + "\n");
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(MessageForm.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    void printProductNearByExpiryDate() {
        listProduct = pr.findAll();
        Date fromDate = new Date();
        LocalDate fromDate1 = new LocalDate(fromDate);
       SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy");
        for (int i = 0; i < listProduct.size(); i++) {
            LocalDate toDate = new LocalDate(listProduct.get(i).getExpiringDate());
            int months = Months.monthsBetween(fromDate1, toDate).getMonths();
            int days = Days.daysBetween(fromDate1,toDate).getDays();
            if (listProduct.get(i).getExpiringDate().after(fromDate)) {
                if (months <= 2) {
                    mothnsLabel.setVisible(true);
                    productsToExpire.append(listProduct.get(i) + " , months to expire : " + months +" : " + " days to expire  : " + days + " - Expiry Date : "
                            +sdf.format(listProduct.get(i).getExpiringDate())+"\n");
                }
            }
        }
    }
    
    void printExpiredProducts(){
        listProduct = pr.findAll();
        Date date = new Date();
        for (int i = 0; i < listProduct.size(); i++) {
            if(listProduct.get(i).getExpiringDate().before(date)){
                expiredLabel.setVisible(true);
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy");
                expiredProductsArea.append(listProduct.get(i).toString1() + " : " + sdf.format(listProduct.get(i).getExpiringDate()) +"\n");
            }
        }
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel expiredLabel;
    private javax.swing.JTextArea expiredProductsArea;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JLabel mothnsLabel;
    private javax.swing.JTextArea msgArea;
    private javax.swing.JTextArea productsToExpire;
    private javax.swing.JLabel quantityLabel;
    // End of variables declaration//GEN-END:variables
}