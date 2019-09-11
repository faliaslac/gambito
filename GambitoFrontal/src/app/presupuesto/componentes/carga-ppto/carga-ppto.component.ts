import { Component, OnInit } from '@angular/core';
import { VEPRampliado } from '../../models/VEPRampliado';
import { MOPR } from '../../models/MOPR';
import { VersionService } from '../../services/version.service';
import { groupBy } from 'rxjs/internal/operators/groupBy';
import {FormBuilder, Validators} from '@angular/forms';
import { MovimientoService } from '../../services/movimiento.service';

@Component({
  selector: 'app-carga-ppto',
  templateUrl: './carga-ppto.component.html',
  styleUrls: ['./carga-ppto.component.css']
})
export class CargaPptoComponent implements OnInit {

  VEPRs: VEPRampliado[];
  MOPRs: MOPR[];
  mopr: MOPR;
  veprampliado: VEPRampliado;
  constructor(private formBuilder: FormBuilder, private versionservice: VersionService,
              private movimientoservice: MovimientoService) { }

  registerForm = this.formBuilder.group({

    Year: '',
    Version: '',
    Estado: '',
    CodigoPAPR: '',
    CodigoTIPR: ''

  });

  ngOnInit() {

    this.versionservice.getVEPRsWithHeadersAmpliado().subscribe((response: any) => {
      console.log(response);
      this.VEPRs = response.body;
    }, error => console.error(error));
  }

// se ha seleccionado una fila
handleSeleccionarClick(veprId: number, index: number) {
  this.registerForm.patchValue({
    Year: this.VEPRs[index].Year,
    Version: this.VEPRs[index].Version,
    /*Estado: this.VEPRs[index].Estado, */
    CodigoPAPR: this.VEPRs[index].Partida,
    CodigoTIPR: this.VEPRs[index].Tipo,
    });
  this.movimientoservice.getMOPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.MOPRs = response.body;
    }, error => console.error(error));

  }
// guardar el importe del movimiento
GuardarImporte( idmopr: number, index: number, importe: number) {
  console.log('index - ' + index + ' Id - ' + idmopr);
  // const id = this.MOPRs[index].Id_MOPR;
  this.mopr = this.MOPRs[index];
  this.mopr.ImportePresupuesto = importe;
  console.log (this.mopr);
  this.movimientoservice.updateMOPR(this.mopr, idmopr).subscribe((response: MOPR) => console.log(response));
}

}
