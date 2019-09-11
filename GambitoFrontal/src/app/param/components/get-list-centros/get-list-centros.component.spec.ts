import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListCentrosComponent } from './get-list-centros.component';

describe('GetListCentrosComponent', () => {
  let component: GetListCentrosComponent;
  let fixture: ComponentFixture<GetListCentrosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListCentrosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListCentrosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
