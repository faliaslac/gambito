import { Component, OnInit } from '@angular/core';
import { Centro } from '../../models/Centro';
import { CentroService } from '../../services/centros.service';

// ************
// Listado de centros
// ************

@Component({
  selector: 'app-get-list-centros',
  templateUrl: './get-list-centros.component.html',
  styleUrls: ['./get-list-centros.component.css']
})

export class GetListCentroComponent implements OnInit {Centros: Centro[];

  constructor(private CentrosService: CentroService) { }

  ngOnInit() {
    // this.CentrosService.getCentros().subscribe((usersFromAPI: Centro[]) => {
    //   this.Centros = centrosFromAPI;
    this.CentrosService.getCentrosWithHeaders().subscribe((response: any) => {
      console.log(response);
      this.Centros = response.body;
    }, error => console.error(error));
  }
}

