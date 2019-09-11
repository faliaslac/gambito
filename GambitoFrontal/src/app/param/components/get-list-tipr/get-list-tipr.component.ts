import { Component, OnInit } from '@angular/core';
import { TIPR } from '../../models/TIPR';
import { TPTIPRService } from '../../services/tptipr.service';


// ************
// Listado de tipos de presupuesto
// ************

@Component({
  selector: 'app-get-list-tipr',
  templateUrl: './get-list-tipr.component.html',
  styleUrls: ['./get-list-tipr.component.css']
})

export class GetListTiprComponent implements OnInit {TIPRs: TIPR[];

  constructor(private TIPRService: TPTIPRService) { }

  ngOnInit() {
    // this.userService.getUsers().subscribe((usersFromAPI: User[]) => {
    //   this.users = usersFromAPI;
    this.TIPRService.getTIPRsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.TIPRs = response.body;
    }, error => console.error(error));
  }

  handleEditClick(tipr: TIPR) {

  }

  handleDeleteClick(todoId: string, index: number) {

  }
}
