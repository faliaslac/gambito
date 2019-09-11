import { Component, OnInit } from '@angular/core';
import { NIPR } from '../../models/NIPR';
import { TPNIPRService } from '../../services/tpnipr.service';


// ************
// Listado de niveles de presupuesto
// ************

@Component({
  selector: 'app-get-list-nipr',
  templateUrl: './get-list-nipr.component.html',
  styleUrls: ['./get-list-nipr.component.css']
})
export class GetListNIPRComponent implements OnInit {NIPRs: NIPR[];

  constructor(private NIPRService: TPNIPRService) { }

  ngOnInit() {

    this.NIPRService.getNIPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.NIPRs = response.body;
    }, error => console.error(error));
  }

  handleEditClick(nipr: NIPR) {

  }

  handleDeleteClick(todoId: string, index: number) {

  }
}
