import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { DetalleService } from '../services/detalle.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-detalle-index',
  templateUrl: './detalle-index.component.html',
  styleUrls: ['./detalle-index.component.css']
})
export class DetalleIndexComponent implements OnInit {

  list;
  detalleForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private detalleservice: DetalleService,
    private formBuild: FormBuilder,
  ) {
    this.getList();
  }
  ngOnInit() {
    this.getList();
    this.detalleForm = this.formBuild.group({
      
      detalle_id: [''],
      detalle_cargo: ['', [Validators.required]],
      detalle_inicio: ['', [Validators.required]],
      detalle_fin: ['', [Validators.required]],
      empresa_id: ['', [Validators.required]]
    });
    //get data
    let detalle_id = this.route.snapshot.paramMap.get('id');
    if (detalle_id != null) {
      this.detalleservice.getById(detalle_id).subscribe(response => {
        this.detalleForm.setValue(response);
        console.log(response);
      });
    }
  }
  private getList() {
    this.detalleservice.getList().subscribe(response => {
      this.list=response;
    });
  }
  delete(detalle_id) {
    console.log("delete:"+detalle_id);
    this.detalleservice.delete(detalle_id).subscribe(response => {
      console.log("de = " + JSON.stringify(response));
      this.getList();
    });
  }
  save() {
    console.log(this.detalleForm.value);
    let detalle_id = this.route.snapshot.paramMap.get('detalle_id');
    if (detalle_id != null) {
      this.detalleservice.update(detalle_id, this.detalleForm.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.detalleservice.add(this.detalleForm.value).subscribe(response => {
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/detalleindex']);
  }

}
