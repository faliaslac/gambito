
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { TIPR } from '../../models/TIPR';
import { TPTIPRService } from '../../services/tptipr.service';


// ************
// consulta para un tipo de presupuesto
// ************

@Component({
  selector: 'app-get-tipr',
  templateUrl: './get-tipr.component.html',
  styleUrls: ['./get-tipr.component.css']
})

export class GetTIPRComponent implements OnInit {tipr: TIPR;
  notFound = false;


  constructor(private TIPRService: TPTIPRService) { }

  ngOnInit() {
  }

  getUser(userId: string) {
    this.notFound = false;
    this.tipr = null;

    this.TIPRService.getTIPR(userId).subscribe((TIPRFromTheAPI: TIPR) => {
      this.tipr = TIPRFromTheAPI;
    }, (err: any) => {
      console.error(err);
      this.notFound = true;
    });
  }

}


