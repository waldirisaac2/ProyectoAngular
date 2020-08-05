import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EgresadoService } from '../services/egresado.service';

@Component({
  selector: 'app-egresado-index',
  templateUrl: './egresado-index.component.html',
  styleUrls: ['./egresado-index.component.css']
})
export class EgresadoIndexComponent implements OnInit {

  list;
  constructor(
    private route: ActivatedRoute,
    private egresadoService: EgresadoService,
  ) {
    this.getList();
  }
  ngOnInit() {
    this.getList();
  }
  private getList() {
    this.egresadoService.getList().subscribe(response => {
      this.list=response;
    });
  }
  delete(id) {
    console.log("delete:"+id);
    this.egresadoService.delete(id).subscribe(response => {
      console.log("de = " + JSON.stringify(response));
      this.getList();
    });
  }

}
