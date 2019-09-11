import { Component, OnInit } from '@angular/core';
import { VEPR } from '../../models/VEPR';
import { TPVEPRService } from '../../services/tpvepr.service';


// ************
// Listado de versiones de preupuesto
// ************

@Component({
  selector: 'app-get-list-vepr',
  templateUrl: './get-list-vepr.component.html',
  styleUrls: ['./get-list-vepr.component.css']
})
export class GetListVEPRComponent implements OnInit {VEPRs: VEPR[];

  constructor(private VEPRService: TPVEPRService) { }

  ngOnInit() {
    // this.userService.getUsers().subscribe((usersFromAPI: User[]) => {
    //   this.users = usersFromAPI;
    this.VEPRService.getVEPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.VEPRs = response.body;
    }, error => console.error(error));
  }

  handleEditClick(vepr: VEPR) {

  }

  handleDeleteClick(todoId: string, index: number) {

  }
}
