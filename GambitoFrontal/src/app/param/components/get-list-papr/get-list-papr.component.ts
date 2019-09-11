import { Component, OnInit } from '@angular/core';
import { PAPR } from '../../models/PAPR';
import { TPPAPRService } from '../../services/tppapr.service';


// ************
// Listado de partidas presupuestarias
// ************

@Component({
  selector: 'app-get-list-papr',
  templateUrl: './get-list-papr.component.html',
  styleUrls: ['./get-list-papr.component.css']
})
export class GetListPaprComponent implements OnInit {PAPRs: PAPR[];

  constructor(private PAPRService: TPPAPRService) { }

  ngOnInit() {
    // this.userService.getUsers().subscribe((usersFromAPI: User[]) => {
    //   this.users = usersFromAPI;
    this.PAPRService.getPAPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.PAPRs = response.body;
    }, error => console.error(error));
  }

  handleEditClick(tipr: PAPR) {

  }

  handleDeleteClick(todoId: string, index: number) {

  }
}
