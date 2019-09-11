import { Component, OnInit } from '@angular/core';
import { CMDB } from '../../models/CMDB';
import { CMDBService } from '../../services/cmdb.service';

// ************
// Listado de CMDB
// ************

@Component({
  selector: 'app-get-list-cmdb',
  templateUrl: './get-list-cmdb.component.html',
  styleUrls: ['./get-list-cmdb.component.css']
})
export class GetListCMDBComponent implements OnInit {CMDBs: CMDB[];

  constructor(private cmdbService: CMDBService) { }

  ngOnInit() {
    // this.userService.getUsers().subscribe((usersFromAPI: User[]) => {
    //   this.users = usersFromAPI;
    this.cmdbService.getCMDBsWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.CMDBs = response.body;
    }, error => console.error(error));
  }

  handleEditClick(tipr: CMDB) {

  }

  handleDeleteClick(todoId: string, index: number) {

  }
}
