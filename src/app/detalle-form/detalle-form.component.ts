import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { DetalleService } from '../services/detalle.service';

@Component({
  selector: 'app-detalle-form',
  templateUrl: './detalle-form.component.html',
  styleUrls: ['./detalle-form.component.css']
})
export class DetalleFormComponent implements OnInit {

  detalleForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private detalleservice: DetalleService,
  ) {
  }
  ngOnInit() {

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
  save() {
    console.log(this.detalleForm.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.detalleservice.update(id, this.detalleForm.value).subscribe(response => {
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
