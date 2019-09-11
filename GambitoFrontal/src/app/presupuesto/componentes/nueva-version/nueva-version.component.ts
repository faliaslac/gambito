import { Component, OnInit } from '@angular/core';
import {FormBuilder, Validators} from '@angular/forms';
import { PAPR } from '../../models/PAPR.enum';
import { TIPR } from '../../models/TIPR.enum';
import { VEPR } from '../../models/VEPR';
import { VersionService } from '../../services/version.service';
import { from } from 'rxjs';
import { filter } from 'rxjs/operators';


// ************
// Nueva versión del presupuesto
// ************

@Component({
  selector: 'app-nueva-version',
  templateUrl: './nueva-version.component.html',
  styleUrls: ['./nueva-version.component.css']
})
export class NuevaVersionComponent implements OnInit {
  VEPRs: VEPR[];

  model: VEPR = {Id_VEPR: 0, Year: 0, Version: 0, Estado: '',  CodigoPAPR: '', CodigoTIPR: ''};


  constructor( private formBuilder: FormBuilder, private versionservice: VersionService) { }

  // abreviar la forma de referirse a los campos del formulario
  get year() {
    return this.registerForm.get('Year');
  }

  get version() {
    return this.registerForm.get('Version');
  }

  get estado() {
    return this.registerForm.get('Estado');
  }

  get partida() {
    return this.registerForm.get('CodigoPAPR');
  }

  get tipo() {
    return this.registerForm.get('CodigoTIPR');
  }

  registerForm = this.formBuilder.group({
    Id_VEPR: 0,
    Year: ['', {
      validators: [Validators.required, Validators.minLength(4), Validators.maxLength(4)]
      /* asyncValidators: [this.UnicoService.validate.bind(this.usernameUnicoService)],
      updateOn: 'blur' */
    }],
    Version: 0,
    Estado: 'A',
    CodigoPAPR: [PAPR.Gasto],
    CodigoTIPR: [TIPR.Ordinario]

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
  }

  submit() {
    console.log(this.registerForm.value);

    if (!this.registerForm.valid) {
      alert('Alguna regla de validación no se está cumpliendo');
      return;
    }
    console.log(this.model);
    this.versionservice.createVEPR(this.model).subscribe((response: VEPR) => console.log(response));
    }

   llenarTabla(year: number) {
      console.log ('año: ' + year);
      this.versionservice.getVEPRsWithHeaders().subscribe((response: any) => {
        console.log(response);
        this.VEPRs = response.body;
      }, error => console.error(error));

    }


}

