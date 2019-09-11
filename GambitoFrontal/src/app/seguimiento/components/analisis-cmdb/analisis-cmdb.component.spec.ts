import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AnalisisCMDBComponent } from './analisis-cmdb.component';

describe('AnalisisCMDBComponent', () => {
  let component: AnalisisCMDBComponent;
  let fixture: ComponentFixture<AnalisisCMDBComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AnalisisCMDBComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AnalisisCMDBComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
