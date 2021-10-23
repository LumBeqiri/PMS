/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.view;

import bll.BillIncome;
import bll.BillIncome;
import bll.BillIncomeDetails;
import bll.Perdoruesi;
import bll.Product;
import bll.Stock;
import com.google.common.collect.Lists;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import connection.Connect;
import dal.BillIncomeRepository;
import dal.BillIncomeRepository;
import dal.PerdoruesiRepository;
import dal.PharmacyException;
import dal.ProductInterface;
import dal.ProductRepository;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.Timer;
import javax.swing.table.DefaultTableModel;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRTableModelDataSource;
import net.sf.jasperreports.view.JasperViewer;
import search.TST;

/**
 *
 * @author Adis Durguti
 */
public class RegistrationForm extends javax.swing.JInternalFrame {

    /**
     * Creates new form POSForm
     */
    private TST<Integer> tstName = new TST<Integer>();
    List<Product> list;
    ProductInterface pi = new ProductRepository();
    Product product = null;
    BillIncomeRepository bor = new BillIncomeRepository();
    BillIncomeRepository bir = new BillIncomeRepository();
    PerdoruesiRepository pr = new PerdoruesiRepository();
    Connect connect = new Connect();
    Product p1 = new Product();
    Connection con = null;
    PreparedStatement pst = null;
    BillIncomeDetails BD = new BillIncomeDetails();
    DefaultTableModel model = new DefaultTableModel();
    LoginForm loginForm = new LoginForm();
    StockForm sf = new StockForm();
    Stock stock = new Stock();
    ReportsForm rf = new ReportsForm();
    String billNumber;
    Perdoruesi pactive1;
    private int qty;
    private int testQuantity;

    public RegistrationForm() {
        initComponents();
        putIntoTSTname();
        dateLabel.setText(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
        showTime();
        dropDownPanel.setVisible(false);
        invoiceNoTxt.setText(gjeneroNrFatures());

    }

    private void showTime() {   //metoda e cila tregon kohen aktuale
        new Timer(0, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                Date d = new Date();
                SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss a");
                timeLabel.setText(s.format(d));
            }
        }).start();
    }

    private void putIntoTSTname() { // metoda e cila inserton ne TST te gjitha produktet
        list = pi.findAll();
        for (int i = 0; i < list.size(); i++) {
            if (!((list.get(i)).toString().trim()).equals("")) {
                String key = list.get(i).toString1().toUpperCase();
                tstName.put(key, i);
            }
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        searchProduct = new javax.swing.JTextField();
        jPanel2 = new javax.swing.JPanel();
        dropDownPanel = new javax.swing.JScrollPane();
        dropDownList = new javax.swing.JList<String>();
        jLabel1 = new javax.swing.JLabel();
        quantityTxt = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        pricePerUnitTxt = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        productIDtxt = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        invoiceNoTxt = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        dateInvoice = new com.toedter.calendar.JDateChooser();
        taxTxt = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        dateLabel = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        timeLabel = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        billDetailsTable = new javax.swing.JTable();
        jPanel4 = new javax.swing.JPanel();
        addButon = new javax.swing.JButton();
        deleteButton = new javax.swing.JButton();
        cancelButton = new javax.swing.JButton();
        buyButton = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        amountTxt = new javax.swing.JLabel();

        setTitle("Registration");

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)), "Product Information"));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        searchProduct.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                searchProductFocusGained(evt);
            }
        });
        searchProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchProductActionPerformed(evt);
            }
        });
        searchProduct.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                searchProductKeyReleased(evt);
            }
        });
        jPanel1.add(searchProduct, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 50, 200, 40));

        dropDownList.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(46, 151, 186), 2));
        dropDownList.setFont(new java.awt.Font("Segoe UI", 0, 12)); // NOI18N
        dropDownList.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                dropDownListMouseClicked(evt);
            }
        });
        dropDownPanel.setViewportView(dropDownList);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(dropDownPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addComponent(dropDownPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 71, 200, -1));

        jLabel1.setText("Product Name");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 30, 200, -1));

        quantityTxt.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        quantityTxt.setText("1");
        quantityTxt.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                quantityTxtKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                quantityTxtKeyReleased(evt);
            }
        });
        jPanel1.add(quantityTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 50, 200, 40));

        jLabel2.setText("Quantity");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 30, 200, -1));

        pricePerUnitTxt.setEditable(false);
        jPanel1.add(pricePerUnitTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 50, 200, 40));

        jLabel3.setText("Price per Unit");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(700, 30, 200, -1));

        jLabel7.setText("Date");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 100, -1, -1));

        productIDtxt.setEditable(false);
        productIDtxt.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        jPanel1.add(productIDtxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 50, 200, 40));

        jLabel6.setText("Product ID");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 30, -1, -1));

        invoiceNoTxt.setEditable(false);
        invoiceNoTxt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                invoiceNoTxtActionPerformed(evt);
            }
        });
        jPanel1.add(invoiceNoTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(1380, 50, 200, 40));

        jLabel4.setText("Invoice No.");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(1380, 30, -1, -1));
        jPanel1.add(dateInvoice, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 120, 200, 40));

        taxTxt.setEditable(false);
        taxTxt.setText("0.18");
        jPanel1.add(taxTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 120, 200, 40));

        jLabel8.setText("TAX");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 100, -1, -1));

        jLabel10.setText("Date");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 30, -1, -1));

        dateLabel.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jPanel1.add(dateLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 50, 190, 40));

        jLabel11.setText("Time");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(1150, 30, -1, -1));

        timeLabel.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jPanel1.add(timeLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(1150, 50, 200, 40));

        billDetailsTable.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        billDetailsTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "PID", "Product", "Quantity", "Price", "Total"
            }
        ));
        billDetailsTable.setToolTipText("");
        jScrollPane2.setViewportView(billDetailsTable);

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0))));

        addButon.setText("Add ");
        addButon.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addButonActionPerformed(evt);
            }
        });

        deleteButton.setText("Delete");
        deleteButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteButtonActionPerformed(evt);
            }
        });

        cancelButton.setText("Cancel");
        cancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelButtonActionPerformed(evt);
            }
        });

        buyButton.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        buyButton.setText("Buy");
        buyButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buyButtonActionPerformed(evt);
            }
        });

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel5.setText("TOTAL AMOUNT");

        amountTxt.setFont(new java.awt.Font("Tahoma", 0, 45)); // NOI18N
        amountTxt.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        amountTxt.setText("00.00$");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap(245, Short.MAX_VALUE)
                .addComponent(addButon, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(90, 90, 90)
                .addComponent(deleteButton, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(90, 90, 90)
                .addComponent(cancelButton, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(108, 108, 108)
                .addComponent(buyButton, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 239, Short.MAX_VALUE)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(amountTxt, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 235, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(addButon, javax.swing.GroupLayout.DEFAULT_SIZE, 60, Short.MAX_VALUE)
                            .addComponent(deleteButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(cancelButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(buyButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(13, 13, 13)
                        .addComponent(amountTxt)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 196, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void searchProductKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_searchProductKeyReleased
        // TODO add your handling code here:    // metoda e cila gjeneron listen me ane te karakterit te pare qe eshte i njejte me ndonje te produktit
        char c = evt.getKeyChar();
        String t = searchProduct.getText().toUpperCase();
        if (!(c == KeyEvent.VK_CAPS_LOCK || c == KeyEvent.VK_SHIFT)) {
            if (!(t.equals(""))) {
                Iterable<String> it = tstName.keysWithPrefix(t);
                List<String> itlist = Lists.newArrayList(it.iterator());
                String[] st = new String[itlist.size()];

                for (int i = 0; i < itlist.size(); i++) {
                    st[i] = itlist.get(i);
                }
                if (!(st.length == 0)) {
                    dropDownList.setListData(st);
                    dropDownPanel.setVisible(true);
                    dropDownList.setFocusable(true);
                    dropDownPanel.setFocusable(true);
                } else {
                    dropDownPanel.setVisible(false);
                }
            } else {
                dropDownPanel.setVisible(false);
            }
        }
    }//GEN-LAST:event_searchProductKeyReleased

    private void searchProductFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_searchProductFocusGained
        // TODO add your handling code here:
        putIntoTSTname();
    }//GEN-LAST:event_searchProductFocusGained

    private void dropDownListMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_dropDownListMouseClicked
        // TODO add your handling code here:    //metode qe ruan produktin nga lista duke e selektuar me mouse dhe i mbush texfieldat me te dhenat e produktit
        String s = dropDownList.getSelectedValue();
        if (s != null) {
            if (Character.isLetter(s.charAt(0))) {
                for (Product list1 : list) {
                    if (list1.toString1().equalsIgnoreCase(s)) {
                        product = list1;

                    }
                }
            }
        }

        if (product != null) {
            searchProduct.setText(product.toString1());
            pricePerUnitTxt.setText(product.getProductSellPrice().toString());
            productIDtxt.setText(product.getProductID().toString());
            quantityTxt.requestFocus();

        }

        dropDownPanel.setVisible(false);
    }//GEN-LAST:event_dropDownListMouseClicked

    private void addButonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addButonActionPerformed
        // TODO add your handling code here:
        Date date = dateInvoice.getDate();
        if (!(searchProduct.getText().trim().equals("") || pricePerUnitTxt.getText().trim().equals(""))) {

            //DefaultTableModel model = (DefaultTableModel) billDetailsTable.getModel();
            model = (DefaultTableModel) billDetailsTable.getModel();
            BigDecimal totalofproduct = new BigDecimal(BigInteger.ZERO);
            BigDecimal quantity = new BigDecimal(quantityTxt.getText());
            BigDecimal price = new BigDecimal(pricePerUnitTxt.getText());
            totalofproduct = quantity.multiply(price);

            model.addRow(new Object[]{product.getProductID(), product, (quantity.toBigInteger()), product.getProductSellPrice(), totalofproduct});
            amountTxt.setText(generateTotal().toString());

            clear();
        } else {
            JOptionPane.showMessageDialog(this, "Please fill the required spaces !");
        }

    }//GEN-LAST:event_addButonActionPerformed
    public BigDecimal generateTotal() {
        BigDecimal total = new BigDecimal(BigInteger.ZERO);
        for (int i = 0; i < billDetailsTable.getRowCount(); i++) {
            BigDecimal amount = (BigDecimal) billDetailsTable.getValueAt(i, 4);
            BigDecimal tax = new BigDecimal(taxTxt.getText());
            //totali=totali+amout + tax*amount
            total = total.add(amount).add(tax.multiply(amount));
        }
        return total;
    }

    void clear() {
        amountTxt.setText(generateTotal().toString() + "$");
        quantityTxt.setText("1");
        searchProduct.setText("");
        pricePerUnitTxt.setText("");
        productIDtxt.setText("");
        dateInvoice.setDate(null);
    }

    private String gjeneroNrFatures() {
        List<BillIncome> list = bor.findAll();
        String n = "PHMS" + (1000000 + list.size() + 1);
        billNumber = n;
        return n;

    }


    private void deleteButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteButtonActionPerformed
        // TODO add your handling code here:
        model = (DefaultTableModel) billDetailsTable.getModel();

        int row = billDetailsTable.getSelectedRow();
        if (row != -1) {
            Object[] ob = {"Yes", "No"};
            int i = JOptionPane.showOptionDialog(this, "Are u sure you want to delete ?", "Deletion", JOptionPane.OK_OPTION, JOptionPane.QUESTION_MESSAGE, null, ob, ob[1]);
            if (i == 0) {
                model.removeRow(row);
                amountTxt.setText(generateTotal().toString() + "$");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Please , choose what you want to delete !");
        }
    }//GEN-LAST:event_deleteButtonActionPerformed

    private void cancelButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelButtonActionPerformed
        // TODO add your handling code here:
        billDetailsTable.clearSelection();
        clear();
    }//GEN-LAST:event_cancelButtonActionPerformed

    private void buyButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buyButtonActionPerformed
        // TODO add your handling code here:
        Date d = new Date();
        Date date2 = dateInvoice.getDate();
        if (!(billDetailsTable.getRowCount() == 0)) {
            if (date2 != null) {
                if (!(dateInvoice.getDate().after(d))) {
                    BillIncome b = new BillIncome();
                    Stock stock = new Stock();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    Date date = new Date();
                    Timestamp timestamp = new Timestamp(date.getTime());
                    try {
                        b.setBillIncomeDate(date);
                        b.setBillNumber(invoiceNoTxt.getText());
                        b.setPerdoruesiID(LoginForm.p);
                        b.setTotal(generateTotal());

                        bir.create(b);
                    } catch (PharmacyException ex) {
                        Logger.getLogger(RegistrationForm.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    try {
                        //Fill BillIncomeDetails table
                        int rows = billDetailsTable.getRowCount();
                        con = connect.getConnect();
                        java.sql.Date sqlDate = new java.sql.Date(dateInvoice.getDate().getTime());
                        java.sql.Timestamp sqlTime = new java.sql.Timestamp(timestamp.getTime());
                        for (int i = 0; i < rows; i++) {
                            int pID = Integer.parseInt(billDetailsTable.getValueAt(i, 0).toString());
                            Product product = (Product) billDetailsTable.getValueAt(i, 1);
                            BigInteger quantity = (BigInteger) billDetailsTable.getValueAt(i, 2);
                            BigDecimal price = (BigDecimal) billDetailsTable.getValueAt(i, 3);
                            BigDecimal subtotal = (BigDecimal) billDetailsTable.getValueAt(i, 4);

                            String queryCo = "Insert into BillIncomeDetails(billIncomeID,productID,quantity,subtotal,billIncomeDate,billIncomeTime) values('" + b.getBillIncomeID() + "','" + pID + "','" + quantity + "','" + subtotal + "','" + sqlDate + "','"
                                    + "" + sqlTime + "')";
                            pst = con.prepareStatement(queryCo);
                            pst.execute();

                            String stocksql = "Select productID from Stock where productID='" + pID + "'";
                            pst = con.prepareStatement(stocksql);
                            ResultSet stockrs = pst.executeQuery();

                            if (!stockrs.next()) {
                                String createStock = "Insert into Stock(productID,stockName,quantity) values('"
                                        + pID + "','" + product.toString1() + "','" + quantity + "')";
                                pst = con.prepareStatement(createStock);
                                pst.execute();
                            } else {
                                String sql = "Select quantity from Stock where productID ='" + pID + "'";
                                pst = con.prepareStatement(sql);
                                ResultSet rs = pst.executeQuery();
                                if (rs.next()) {
                                    qty = rs.getInt(1);
                                }
                                qty += ((BigInteger) quantity).intValue();

                                String queryUpdate = "Update Stock set quantity = ? where productID='" + pID + "'";
                                pst = con.prepareStatement(queryUpdate);
                                pst.setInt(1, qty);
                                pst.executeUpdate();
                            }

                        }
                    } catch (SQLException | NumberFormatException e) {
                        e.printStackTrace();
                    }
                    Object[] ob = {"Yes", "No"};
                    int i = JOptionPane.showOptionDialog(this, "Do you want to Print ?", "Print", JOptionPane.OK_OPTION, JOptionPane.QUESTION_MESSAGE, null, ob, ob[1]);
                    if (i == 0) {
                            printJasperInvoice();
                    } else {

                    }
                    model.setRowCount(0);
                    amountTxt.setText(generateTotal().toString() + "$");
                    invoiceNoTxt.setText(gjeneroNrFatures());
                } else {
                    JOptionPane.showMessageDialog(this, "Date cannot be greater than actual date !");
                }
            } else {
                JOptionPane.showMessageDialog(this, "Please fill the date");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Please fill the required spaces !");
        }
        sf.updateTable();
        rf.loadTableRegister();
    }//GEN-LAST:event_buyButtonActionPerformed

    private void searchProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchProductActionPerformed

    }//GEN-LAST:event_searchProductActionPerformed
    public void printJasperInvoice() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            model = (DefaultTableModel) billDetailsTable.getModel();
            JRTableModelDataSource datasource = new JRTableModelDataSource(model);
            String reportSource = "C:\\Users\\Mimoza\\Desktop\\LabCourse\\Pharmacy\\src\\reports\\IncomeInvoice.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(reportSource);
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("operator", LoginForm.p.getName() + " " + LoginForm.p.getLastName());
            params.put("invoiceNo", invoiceNoTxt.getText());
            params.put("date", sdf.format(dateInvoice.getDate()));
            params.put("time", timeLabel.getText());
            params.put("grandTotal", generateTotal().toString());

            JasperPrint jp = JasperFillManager.fillReport(jr, params, datasource);
            JasperViewer.viewReport(jp, false);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void printoPDF() {

        JFileChooser fch = new JFileChooser();
        fch.setFileSelectionMode(JFileChooser.FILES_ONLY);
        fch.setPreferredSize(new Dimension(700, 500));
        fch.setDialogTitle("Print Invoice");
        int returnVal = fch.showSaveDialog(null);
        if (returnVal == JFileChooser.APPROVE_OPTION) {
            FileOutputStream outtPutFile = null;
            try {
                Document doc = new Document(PageSize.A4.rotate());
                outtPutFile = new FileOutputStream(fch.getSelectedFile().getAbsolutePath() + " Invoice.pdf");
                PdfWriter.getInstance(doc, outtPutFile);
                doc.open();
                doc.add(new Paragraph("                       Invoice NO: " + billNumber));
                doc.add(new Paragraph("                       Operator  : " + LoginForm.p.getName() + " " + LoginForm.p.getLastName()));
                doc.add(new Paragraph("                       Date : " + new SimpleDateFormat("dd-MM-yyy").format(new Date())));
                doc.add(new Paragraph("                       Time : " + new SimpleDateFormat("HH:mm:ss").format(new Date())));
                doc.add(new Paragraph(""));
                PdfPTable pdfTable = new PdfPTable(billDetailsTable.getColumnCount());
                for (int i = 0; i < billDetailsTable.getColumnCount(); i++) {
                    pdfTable.addCell(billDetailsTable.getColumnName(i));
                }
                for (int rows = 0; rows < billDetailsTable.getRowCount(); rows++) {
                    for (int cols = 0; cols < billDetailsTable.getColumnCount(); cols++) {
                        pdfTable.addCell(billDetailsTable.getModel().getValueAt(rows, cols).toString());

                    }
                }
                doc.add(new Paragraph("\n"));
                doc.add(pdfTable);
                doc.add(new Paragraph("\n"));
                doc.add(new Paragraph("                                                                                                                                                                           Total Amount: " + generateTotal()));
                doc.close();
                JOptionPane.showMessageDialog(this, "Invoice saved successfully");
            } catch (FileNotFoundException | DocumentException ex) {
                Logger.getLogger(RegistrationForm.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    outtPutFile.close();
                } catch (IOException ex) {
                    Logger.getLogger(RegistrationForm.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    private void quantityTxtKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_quantityTxtKeyReleased
        if (quantityTxt.getText().matches("^[0-9 ]*$")) {

        } else {
            JOptionPane.showMessageDialog(this, "Quantity cannot contain letters !");
            quantityTxt.setText("1");
        }
    }//GEN-LAST:event_quantityTxtKeyReleased

    private void quantityTxtKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_quantityTxtKeyPressed
        // TODO add your handling code here:
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            addButonActionPerformed(null);
            searchProduct.requestFocus();
        }
    }//GEN-LAST:event_quantityTxtKeyPressed

    private void invoiceNoTxtActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_invoiceNoTxtActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_invoiceNoTxtActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addButon;
    private javax.swing.JLabel amountTxt;
    private javax.swing.JTable billDetailsTable;
    private javax.swing.JButton buyButton;
    private javax.swing.JButton cancelButton;
    private com.toedter.calendar.JDateChooser dateInvoice;
    private javax.swing.JLabel dateLabel;
    private javax.swing.JButton deleteButton;
    private javax.swing.JList<String> dropDownList;
    private javax.swing.JScrollPane dropDownPanel;
    private javax.swing.JTextField invoiceNoTxt;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextField pricePerUnitTxt;
    private javax.swing.JTextField productIDtxt;
    private javax.swing.JTextField quantityTxt;
    private javax.swing.JTextField searchProduct;
    public javax.swing.JTextField taxTxt;
    private javax.swing.JLabel timeLabel;
    // End of variables declaration//GEN-END:variables
}
