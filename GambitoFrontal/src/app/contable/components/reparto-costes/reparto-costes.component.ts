import { Component, OnInit } from '@angular/core';
import {FormBuilder, Validators} from '@angular/forms';
import { BATCALC } from '../../models/BATCALC';
import {RepartoService} from '../../services/reparto.service';
import { DatePipe } from '@angular/common';

// ************
// Reparto de costes para los informes de seguimiento
// ************

@Component({
  selector: 'app-reparto-costes',
  templateUrl: './reparto-costes.component.html',
  styleUrls: ['./reparto-costes.component.css']
})
export class RepartoCostesComponent implements OnInit {

  date = new Date();
  strDate = this.date.getFullYear() + '/' + (this.date.getMonth() + 1) + '/' + this.date.getDate();

  model: BATCALC = {
    IdCalcBI: 0,
    FecCalculo: this.strDate
  };



constructor(private formBuilder: FormBuilder,  private repartoservice: RepartoService) { }

  cabeceraForm = this.formBuilder.group({
    Fecha: [ this.strDate, {
      validators: [Validators.required, Validators.minLength(4), Validators.maxLength(4)]
    }],

  });

  ngOnInit() {
  }

// generar el registro BATCALC para que el trigger reparta las facturas
RepartoCostes() {

  this.model.FecCalculo = this.cabeceraForm.get('Fecha').value;
  console.log(this.model);
  this.repartoservice.createBATCALC(this.model).subscribe((response: BATCALC) => console.log(response));

}

}
