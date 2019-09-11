import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { GetTIPRComponent } from './param/components/get-tipr/get-tipr.component';
import { GetListTiprComponent } from './param/components/get-list-tipr/get-list-tipr.component';
import { MenuComponent } from './menu/menu.component';
import { GetListPaprComponent } from './param/components/get-list-papr/get-list-papr.component';
import { GetListCentroComponent } from './param/components/get-list-centros/get-list-centros.component';
import { GetListCMDBComponent } from './param/components/get-list-cmdb/get-list-cmdb.component';
import { NuevaVersionComponent } from './presupuesto/componentes/nueva-version/nueva-version.component';
import { CierrePptoComponent } from './presupuesto/componentes/cierre-ppto/cierre-ppto.component';
import { CargaPptoComponent } from './presupuesto/componentes/carga-ppto/carga-ppto.component';
import { AnalisisCMDBComponent } from './seguimiento/components/analisis-cmdb/analisis-cmdb.component';
import { FacturasComponent } from './contable/components/facturas/facturas.component';
import { AyudaContableComponent } from './contable/components/ayuda-contable/ayuda-contable.component';
import { RepartoCostesComponent } from './contable/components/reparto-costes/reparto-costes.component';
import { GetListProveedorComponent } from './param/components/get-list-proveedor/get-list-proveedor.component';
import { AyudaParamComponent } from './param/components/ayuda-param/ayuda-param.component';
import { SeguiPresuComponent } from './seguimiento/components/segui-presu/segui-presu.component';
import { AnalisisCentrosComponent } from './seguimiento/components/analisis-centros/analisis-centros.component';
import { AnalisisProveedorComponent } from './seguimiento/components/analisis-proveedor/analisis-proveedor.component';
import { AyudaSeguiComponent } from './seguimiento/components/ayuda-segui/ayuda-segui.component';
import { AyudaPresuComponent } from './presupuesto/componentes/ayuda-presu/ayuda-presu.component';
import { GetListNIPRComponent } from './param/components/get-list-nipr/get-list-nipr.component';



@NgModule({
  declarations: [
    AppComponent,
    GetTIPRComponent,
    GetListTiprComponent,
    MenuComponent,
    GetListPaprComponent,
    GetListCentroComponent,
    GetListCMDBComponent,
    NuevaVersionComponent,
    CierrePptoComponent,
    CargaPptoComponent,
    AnalisisCMDBComponent,
    FacturasComponent,
    AyudaContableComponent,
    RepartoCostesComponent,
    GetListProveedorComponent,
    AyudaParamComponent,
    SeguiPresuComponent,
    AnalisisCentrosComponent,
    AnalisisProveedorComponent,
    AyudaSeguiComponent,
    AyudaPresuComponent,
    GetListNIPRComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
