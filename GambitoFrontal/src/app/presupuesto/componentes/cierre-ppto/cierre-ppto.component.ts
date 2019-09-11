import { Component, OnInit } from '@angular/core';
import { VEPR } from '../../models/VEPR';
import { VersionService } from '../../services/version.service';


// ************
// aprobación y reapertura de presupuesto
// ************

@Component({
  selector: 'app-cierre-ppto',
  templateUrl: './cierre-ppto.component.html',
  styleUrls: ['./cierre-ppto.component.css']
})
export class CierrePptoComponent implements OnInit { VEPRs: VEPR[];

  vepr: VEPR;
  constructor(private versionservice: VersionService) { }

  ngOnInit() {

    this.versionservice.getVEPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.VEPRs = response.body;
    }, error => console.error(error));
  }

// cerrar el presupuesto
  handleAprobarClick(veprId: number, index: number) {
    const id = this.VEPRs[index].Id_VEPR;
    this.vepr = this.VEPRs[index];
    this.vepr.Estado = 'C';
    this.versionservice.updateVEPR(this.vepr, id).subscribe((response: VEPR) => console.log(response));
  }
// reabrir el presupuesto
  handleReabrirClick(veprId: number, index: number) {
    const id = this.VEPRs[index].Id_VEPR;
    this.vepr = this.VEPRs[index];
    this.vepr.Estado = 'A';
    this.versionservice.updateVEPR(this.vepr, id).subscribe((response: VEPR) => console.log(response));


  }
}
