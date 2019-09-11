import { Component, OnInit } from '@angular/core';
import { MOFA } from '../../models/MOFA';
import {MOPRampliado} from '../../../presupuesto/models/MOPR'
import { MOFAdetalle } from '../../models/MOFAdetalle';
import { FacturasService } from '../../services/facturas.service';
import { MovimientoService } from '../../../presupuesto/services/movimiento.service';
import {FormBuilder, Validators} from '@angular/forms';
import { PAPR } from '../../../presupuesto/models/PAPR.enum';
import { TIPR } from '../../../presupuesto/models/TIPR.enum';
import { ProveedorService} from '../../../param/services/proveedor.service';
import { PROV } from '../../../param/models/proveedor';

// ************
// Grabación de facturas
// ************

@Component({
  selector: 'app-facturas',
  templateUrl: './facturas.component.html',
  styleUrls: ['./facturas.component.css']
})
export class FacturasComponent implements OnInit {

  prov: PROV;
  MOFAs: MOFAdetalle[];
  MOPRs: MOPRampliado[];
  mofa: MOFA;
  model: MOFA = {
    IdMOFA: 0,
    IdMOPR: 0,
    IdProveedor: 0,
    NIFProveedor: '',
    FecPago: '',
    FecFactura: '',
    ImpBruto: 0,
    Impuesto: 0,
    ImpNeto: 0,
    Concepto: ''
  };

  constructor(private formBuilder: FormBuilder, private facturasservice: FacturasService,
              private movimientoservice: MovimientoService, private proveedorservice: ProveedorService) { }

  cabeceraForm = this.formBuilder.group({
    Year: ['', {
      validators: [Validators.required, Validators.minLength(4), Validators.maxLength(4)]
    }],
    CodigoPAPR: [PAPR.Gasto],
    CodigoTIPR: [TIPR.Ordinario]
  });

  proveedorForm = this.formBuilder.group({
    IdProveedor: 0,
    NIFProveedor: '',
    NombreProveedor: ''
  })
  facturaForm = this.formBuilder.group({
    IdMOPR: 0,
    FecPago: '',
    FecFactura: '',
    ImpBruto: 0,
    Impuesto: 0,
    ImpNeto: 0,
    Concepto: ''

  });

  PAPRs: any[] = [];
  TIPRs: any[] = [];


  ngOnInit() {

    for (let item in PAPR) {
      if (isNaN(Number(item))) {
        this.PAPRs.push({ text: item, value: PAPR[item] });
      }
    }

    for (let item in TIPR) {
      if (isNaN(Number(item))) {
        this.TIPRs.push({ text: item, value: TIPR[item] });
      }
    }
// carga movimientos de presupuesto
    this.movimientoservice.getMOPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.MOPRs = response.body;
    }, error => console.error(error));


  }
// se ha seleccionado una fila
    handleSeleccionarClick(index: number) {
      console.log('seleccionado- ' + index);
      this.model.IdMOPR = this.MOPRs[index].Id_MOPR;
    }


// guardar el registro de factura
GuardarFactura() {

  this.model.Concepto = this.facturaForm.get('Concepto').value;
  this.model.FecFactura = this.facturaForm.get('FecFactura').value;
  this.model.FecPago = this.facturaForm.get('FecPago').value;
  this.model.NIFProveedor = this.proveedorForm.get('NIFProveedor').value;
  this.model.ImpBruto = this.facturaForm.get('ImpBruto').value;
  this.model.Impuesto = this.facturaForm.get('Impuesto').value;
  this.model.ImpNeto = this.facturaForm.get('ImpNeto').value;
  this.model.IdProveedor = this.proveedorForm.get('IdProveedor').value;
  console.log(this.model);
  this.facturasservice.createMOFA(this.model).subscribe((response: MOFA) => console.log(response));

  // carga movimientos de presupuesto
  this.movimientoservice.getMOPRsWithHeaders().subscribe((response: any) => {
    console.log(response);
    this.MOPRs = response.body;
  }, error => console.error(error));
}


BuscarProveedor() {

  this.proveedorservice.getPROV(this.proveedorForm.get('NIFProveedor').value).subscribe((response: any) => {
    console.log(response);
    this.prov = response;
    console.log (this.prov);


    this.proveedorForm.patchValue({
      NombreProveedor: this.prov.Nombre,
      IdProveedor: this.prov.Id_Prov
    });
  }, error => console.error(error));
}
}
