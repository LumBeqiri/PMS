/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.view;

import bll.Company;
import dal.CompanyRepository;
import dal.PharmacyException;
import gui.model.CompanyTableModel;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

/**
 *
 * @author Adis Durguti
 */
public class CompanyForm extends javax.swing.JInternalFrame {

    /**
     * Creates new form CompanyForm
     */
    public CompanyForm() {
        initComponents();
        loadTable();
        tabelaSelectedIndexChange();
    }
    CompanyRepository cr = new CompanyRepository();
    CompanyTableModel ctm = new CompanyTableModel();

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jSeparator5 = new javax.swing.JSeparator();
        companyIDtxt = new javax.swing.JTextField();
        companyNametxt = new javax.swing.JTextField();
        companyEmailtxt = new javax.swing.JTextField();
        contactNumbertxt = new javax.swing.JTextField();
        companyCountrytxt = new javax.swing.JTextField();
        companyAddresstxt = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        companyTable = new javax.swing.JTable();
        addCompanyBtn = new javax.swing.JButton();
        updateCompanyBtn = new javax.swing.JButton();
        deleteCompanyBtn = new javax.swing.JButton();
        cancelBtn = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JSeparator();
        jSeparator2 = new javax.swing.JSeparator();
        jSeparator3 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();
        jSeparator6 = new javax.swing.JSeparator();
        jSeparator7 = new javax.swing.JSeparator();
        bussinessNoTxt = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jSeparator8 = new javax.swing.JSeparator();

        setResizable(true);
        setTitle("Company");

        companyIDtxt.setEditable(false);

        companyNametxt.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                companyNametxtKeyReleased(evt);
            }
        });

        contactNumbertxt.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                contactNumbertxtKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                contactNumbertxtKeyTyped(evt);
            }
        });

        companyCountrytxt.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                companyCountrytxtKeyReleased(evt);
            }
        });

        jLabel1.setText("CompanyID");

        jLabel2.setText("CompanyName");

        jLabel3.setText("CompanyEmail");

        jLabel4.setText("ContactNumber");

        jLabel5.setText("CompanyCountry");

        jLabel6.setText("CompanyAddress");

        companyTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(companyTable);

        addCompanyBtn.setText("Add Company");
        addCompanyBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addCompanyBtnActionPerformed(evt);
            }
        });

        updateCompanyBtn.setText("Update Company");
        updateCompanyBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateCompanyBtnActionPerformed(evt);
            }
        });

        deleteCompanyBtn.setText("Delete Company");
        deleteCompanyBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteCompanyBtnActionPerformed(evt);
            }
        });

        cancelBtn.setText("Cancel");
        cancelBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelBtnActionPerformed(evt);
            }
        });

        jLabel7.setText("Bussiness Number");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(58, 58, 58)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(companyIDtxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jSeparator1)
                    .addComponent(jLabel5)
                    .addComponent(jLabel4)
                    .addComponent(companyNametxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(companyEmailtxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(contactNumbertxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(companyCountrytxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(jLabel3)
                    .addComponent(companyAddresstxt, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 103, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(jSeparator2)
                    .addComponent(jSeparator3)
                    .addComponent(jSeparator4)
                    .addComponent(jSeparator6)
                    .addComponent(jSeparator7)
                    .addComponent(bussinessNoTxt)
                    .addComponent(jLabel7)
                    .addComponent(jSeparator8))
                .addGap(54, 54, 54)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 145, Short.MAX_VALUE)
                        .addComponent(addCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(77, 77, 77)
                        .addComponent(updateCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(66, 66, 66)
                        .addComponent(deleteCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(77, 77, 77)
                        .addComponent(cancelBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(66, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(103, 103, 103)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 520, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cancelBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(deleteCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(updateCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(addCompanyBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(companyIDtxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(bussinessNoTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator8, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(companyNametxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator2, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(22, 22, 22)
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(companyEmailtxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator3, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(20, 20, 20)
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(contactNumbertxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jSeparator4, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(24, 24, 24)
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(companyCountrytxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jSeparator6, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(10, 10, 10)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(companyAddresstxt, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jSeparator7, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    private void tabelaSelectedIndexChange() {
        final ListSelectionModel rowSM = companyTable.getSelectionModel();
        rowSM.addListSelectionListener(new ListSelectionListener() {
            public void valueChanged(ListSelectionEvent Ise) {
                if (Ise.getValueIsAdjusting()) {
                    return;
                }
                ListSelectionModel rowSM = (ListSelectionModel) Ise.getSource();
                int selectedIndex = rowSM.getAnchorSelectionIndex();
                if (selectedIndex > -1) {
                    Company c = ctm.getCompany(selectedIndex);
                    companyIDtxt.setText(c.getCompanyID() + "");
                    companyNametxt.setText(c.getCompanyName() + "");
                    companyEmailtxt.setText(c.getCompanyEmail() + "");
                    contactNumbertxt.setText(c.getCompanyContactNumber() + "");
                    companyCountrytxt.setText(c.getCompanyCountry() + "");
                    companyAddresstxt.setText(c.getCompanyAddress() + "");
                    bussinessNoTxt.setText(c.getCompanyBussinesNumber()+"");

                }
            }
        });
    }

    public void loadTable() {
        try {
            List<Company> list = cr.findAll();
            ctm.addList(list);
            companyTable.setModel(ctm);
            ctm.fireTableDataChanged();
        } catch (PharmacyException ex) {
            Logger.getLogger(CompanyForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void clear() {
        companyTable.clearSelection();
        companyIDtxt.setText("");
        companyNametxt.setText("");
        companyEmailtxt.setText("");
        companyAddresstxt.setText("");
        companyCountrytxt.setText("");
        contactNumbertxt.setText("");
        bussinessNoTxt.setText("");
    }

    boolean check() {
        if (!(companyNametxt.getText().trim().equals("") || companyEmailtxt.getText().trim().equals("")
                || companyCountrytxt.getText().trim().equals("") || companyAddresstxt.getText().trim().equals("") || contactNumbertxt.getText().trim().equals(""))) {
            return true;
        }
        return false;
    }
    private void addCompanyBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addCompanyBtnActionPerformed
        // TODO add your handling code here:

        if (check()) {
            Company c = new Company();
            //c.setCompanyID(Integer.parseInt(companyIDtxt.getText()));
            c.setCompanyName(companyNametxt.getText());
            c.setCompanyEmail(companyEmailtxt.getText());
            c.setCompanyBussinesNumber(bussinessNoTxt.getText());
            c.setCompanyCountry(companyCountrytxt.getText());
            c.setCompanyAddress(companyAddresstxt.getText());
            c.setCompanyContactNumber(contactNumbertxt.getText());
            try {
                cr.create(c);
            } catch (PharmacyException ex) {
                Logger.getLogger(CompanyForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Please,fill all the required information !");
        }
        loadTable();
        clear();
    }//GEN-LAST:event_addCompanyBtnActionPerformed

    private void cancelBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelBtnActionPerformed
        // TODO add your handling code here:
        clear();
    }//GEN-LAST:event_cancelBtnActionPerformed

    private void updateCompanyBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateCompanyBtnActionPerformed
        // TODO add your handling code here:
        int row = companyTable.getSelectedRow();
        if (row >= 0) {
            try {
                Company c = ctm.getCompany(row);
                //c.setCompanyID(Integer.parseInt(companyIDtxt.getText()));
                c.setCompanyName(companyNametxt.getText());
                c.setCompanyEmail(companyEmailtxt.getText());
                c.setCompanyBussinesNumber(bussinessNoTxt.getText());
                c.setCompanyCountry(companyCountrytxt.getText());
                c.setCompanyAddress(companyAddresstxt.getText());
                c.setCompanyContactNumber(contactNumbertxt.getText());
                cr.edit(c);
            } catch (PharmacyException ex) {
                JOptionPane.showMessageDialog(this, "MSG: " + ex.getMessage());
            }
               loadTable();
            clear();
        }
    }//GEN-LAST:event_updateCompanyBtnActionPerformed

    private void deleteCompanyBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteCompanyBtnActionPerformed
        // TODO add your handling code here:
          int row = companyTable.getSelectedRow();
       if(row != -1){
          Object [] ob = {"Yes" , "No"};
          int i = JOptionPane.showOptionDialog(this,"Do you want to delete ?" , "Deleteion" , JOptionPane.OK_OPTION,JOptionPane.QUESTION_MESSAGE , null ,ob ,ob[1]);
          if(i==0){
              try{
                  Company c = ctm.getCompany(row);
                  cr.delete(c);
                  clear();
                  loadTable();
              }catch(PharmacyException ex){
                  JOptionPane.showMessageDialog(this, "MSG: " + ex.getMessage());
              }
          }else{
              clear();
          }
       }else{
           JOptionPane.showMessageDialog(this,"Please choose what you want to delete !");
       }
    }//GEN-LAST:event_deleteCompanyBtnActionPerformed

    private void contactNumbertxtKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_contactNumbertxtKeyReleased
        // TODO add your handling code here:
        
    }//GEN-LAST:event_contactNumbertxtKeyReleased

    private void contactNumbertxtKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_contactNumbertxtKeyTyped
        // TODO add your handling code here:
        
    }//GEN-LAST:event_contactNumbertxtKeyTyped

    private void companyNametxtKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_companyNametxtKeyReleased
        // TODO add your handling code here:
        if(!companyNametxt.getText().matches("^[a-zA-Z]*$")){
            JOptionPane.showMessageDialog(this,"CompanyName cannot contain numbers !");
            companyNametxt.setText("");
        }else{
            
        }
    }//GEN-LAST:event_companyNametxtKeyReleased

    private void companyCountrytxtKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_companyCountrytxtKeyReleased
        // TODO add your handling code here:
        if(!companyCountrytxt.getText().matches("^[a-zA-Z]*$")){
            JOptionPane.showMessageDialog(this,"Country cannot contain numbers !");
            companyCountrytxt.setText("");
        }else{
            
        }
    }//GEN-LAST:event_companyCountrytxtKeyReleased


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addCompanyBtn;
    private javax.swing.JTextField bussinessNoTxt;
    private javax.swing.JButton cancelBtn;
    private javax.swing.JTextField companyAddresstxt;
    private javax.swing.JTextField companyCountrytxt;
    private javax.swing.JTextField companyEmailtxt;
    private javax.swing.JTextField companyIDtxt;
    private javax.swing.JTextField companyNametxt;
    private javax.swing.JTable companyTable;
    private javax.swing.JTextField contactNumbertxt;
    private javax.swing.JButton deleteCompanyBtn;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator5;
    private javax.swing.JSeparator jSeparator6;
    private javax.swing.JSeparator jSeparator7;
    private javax.swing.JSeparator jSeparator8;
    private javax.swing.JButton updateCompanyBtn;
    // End of variables declaration//GEN-END:variables
}