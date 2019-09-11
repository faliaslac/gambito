import { Component, OnInit } from '@angular/core';
import { PROV } from '../../models/proveedor';
import { ProveedorService } from '../../services/proveedor.service';
import {FormBuilder, Validators} from '@angular/forms';


// ************
// Mantenimiento de proveedores
// ************

@Component({
  selector: 'app-get-list-proveedor',
  templateUrl: './get-list-proveedor.component.html',
  styleUrls: ['./get-list-proveedor.component.css']
})

export class GetListProveedorComponent implements OnInit {


  PROVs: PROV[];
  prov: PROV;
  model: PROV = {
    Id_Prov: 0,
    NIF: '',
    Nombre: '',
    Localidad: '',
  };

  constructor(private formBuilder: FormBuilder, private proveedorservice: ProveedorService) { }

  datosForm = this.formBuilder.group({
    NIF: ['', {
      validators: [Validators.required, Validators.minLength(4), Validators.maxLength(4)]
    }],
    Nombre: ['', {
      validators: [Validators.required,  Validators.maxLength(11)]
    }],
    Localidad: ['', {
      validators: [Validators.required, Validators.maxLength(50)]
    }],
  });


  ngOnInit() {

  // carga lista de proveedores
  this.CargaProveedores();

  }

// guardar el registro de proveedor
GuardarProveedor() {

  this.model.Localidad = this.datosForm.get('Localidad').value;
  this.model.NIF = this.datosForm.get('NIF').value;
  this.model.Nombre = this.datosForm.get('Nombre').value;
  console.log(this.model);
  this.proveedorservice.createPROV(this.model).subscribe((response: PROV) => console.log(response));
  this.CargaProveedores();

}
CargaProveedores(){
  // carga lista de proveedores
  this.proveedorservice.getPROVsWithHeaders().subscribe((response: any) => {
    console.log(response);
    this.PROVs = response.body;
  }, error => console.error(error));
}

}
