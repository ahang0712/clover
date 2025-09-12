; ModuleID = 'brake3.c'
source_filename = "brake3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !0
@brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !6
@brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !9
@brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !11
@cnt1 = common global i32 0, align 4, !dbg !85
@brake_acc_nodiv_ctrl_P_RT_X0 = common global i32 0, align 4, !dbg !27
@brake_acc_nodiv_ctrl_B_local_RT_h = common global i32 0, align 4, !dbg !13
@brake_acc_nodiv_ctrl_P_RT4_X0 = common global i32 0, align 4, !dbg !29
@brake_acc_nodiv_ctrl_B_local_RT4 = common global i32 0, align 4, !dbg !17
@test = common global i32 0, align 4, !dbg !55
@brake_acc_nodiv_ctrl_P_Distribution_Gain1 = common global i32 0, align 4, !dbg !41
@brake_acc_nodiv_ctrl_B_local_RT14 = common global i32 0, align 4, !dbg !25
@Distribution_idx = common global i32 0, align 4, !dbg !79
@brake_acc_nodiv_ctrl_P_Distribution_Gain2 = common global i32 0, align 4, !dbg !43
@Distribution_idx_0 = common global i32 0, align 4, !dbg !81
@brake_acc_nodiv_ctrl_P_Distribution_Gain3 = common global i32 0, align 4, !dbg !45
@Distribution_idx_1 = common global i32 0, align 4, !dbg !83
@RT9 = common global i32 0, align 4, !dbg !57
@RT10 = common global i32 0, align 4, !dbg !59
@vkmh = common global i32 0, align 4, !dbg !53
@RT4_Buffer0 = common global i32 0, align 4, !dbg !77
@RT1_Buffer0 = common global i32 0, align 4, !dbg !71
@RT2_Buffer0 = common global i32 0, align 4, !dbg !73
@RT3_Buffer0 = common global i32 0, align 4, !dbg !75
@cnt2 = common global i32 0, align 4, !dbg !87
@brake_acc_nodiv_ctrl_P_RT1_X0 = common global i32 0, align 4, !dbg !31
@brake_acc_nodiv_ctrl_B_local_RT1 = common global i32 0, align 4, !dbg !19
@cnt3 = common global i32 0, align 4, !dbg !89
@RT_Buffer0 = common global i32 0, align 4, !dbg !67
@brake_acc_nodiv_ctrl_B_local_RT3 = common global i32 0, align 4, !dbg !23
@brake_acc_nodiv_ctrl_P_Gain1_Gain = common global i32 0, align 4, !dbg !37
@RT14 = common global i32 0, align 4, !dbg !65
@RT12 = common global i32 0, align 4, !dbg !63
@cnt4 = common global i32 0, align 4, !dbg !91
@brake_acc_nodiv_ctrl_B_local_RT2 = common global i32 0, align 4, !dbg !21
@RT11 = common global i32 0, align 4, !dbg !61
@brake_acc_nodiv_ctrl_P_RT2_X0 = common global i32 0, align 4, !dbg !33
@brake_acc_nodiv_ctrl_P_RT3_X0 = common global i32 0, align 4, !dbg !35
@brake_acc_nodiv_ctrl_B_local_RTH = common global i32 0, align 4, !dbg !15
@brake_acc_nodiv_ctrl_P_Distribution_Gain0 = common global i32 0, align 4, !dbg !39
@brake_acc_nodiv_ctrl_P_average_rpm_Gain = common global i32 0, align 4, !dbg !47
@brake_acc_nodiv_ctrl_P_wgrads_Gain = common global i32 0, align 4, !dbg !49
@brake_acc_nodiv_ctrl_P_vkmh_Gain = common global i32 0, align 4, !dbg !51
@RT0_Buffer0 = common global i32 0, align 4, !dbg !69

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_compute() #0 !dbg !99 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !102
  %2 = add nsw i32 %1, 1, !dbg !102
  store i32 %2, i32* @cnt1, align 4, !dbg !102
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !103
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !104
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !105
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !106
  store i32 0, i32* @test, align 4, !dbg !107
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !108
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !109
  %7 = add nsw i32 %5, %6, !dbg !110
  store i32 %7, i32* @Distribution_idx, align 4, !dbg !111
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !112
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !113
  %10 = add nsw i32 %8, %9, !dbg !114
  store i32 %10, i32* @Distribution_idx_0, align 4, !dbg !115
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !116
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !117
  %13 = add nsw i32 %11, %12, !dbg !118
  store i32 %13, i32* @Distribution_idx_1, align 4, !dbg !119
  %14 = load i32, i32* @RT9, align 4, !dbg !120
  %15 = load i32, i32* @RT10, align 4, !dbg !121
  %16 = add nsw i32 %14, %15, !dbg !122
  store i32 %16, i32* @vkmh, align 4, !dbg !123
  %17 = load i32, i32* @test, align 4, !dbg !124
  %18 = add nsw i32 %17, 1, !dbg !124
  store i32 %18, i32* @test, align 4, !dbg !124
  %19 = load i32, i32* @test, align 4, !dbg !125
  %20 = icmp ne i32 %19, 0, !dbg !127
  br i1 %20, label %21, label %22, !dbg !128

21:                                               ; preds = %0
  br label %22, !dbg !129

22:                                               ; preds = %21, %0
  %23 = load i32, i32* @test, align 4, !dbg !131
  %24 = icmp ne i32 %23, 1, !dbg !133
  br i1 %24, label %25, label %26, !dbg !134

25:                                               ; preds = %22
  br label %26, !dbg !135

26:                                               ; preds = %25, %22
  %27 = load i32, i32* @vkmh, align 4, !dbg !137
  store i32 %27, i32* @RT4_Buffer0, align 4, !dbg !138
  %28 = load i32, i32* @Distribution_idx, align 4, !dbg !139
  store i32 %28, i32* @RT1_Buffer0, align 4, !dbg !140
  %29 = load i32, i32* @Distribution_idx_0, align 4, !dbg !141
  store i32 %29, i32* @RT2_Buffer0, align 4, !dbg !142
  %30 = load i32, i32* @Distribution_idx_1, align 4, !dbg !143
  store i32 %30, i32* @RT3_Buffer0, align 4, !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_1() #0 !dbg !146 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = load i32, i32* @cnt2, align 4, !dbg !147
  %4 = add nsw i32 %3, 1, !dbg !147
  store i32 %4, i32* @cnt2, align 4, !dbg !147
  store i32 0, i32* @test, align 4, !dbg !148
  %5 = load i32, i32* @test, align 4, !dbg !149
  %6 = icmp ne i32 %5, 0, !dbg !151
  br i1 %6, label %7, label %8, !dbg !152

7:                                                ; preds = %0
  br label %8, !dbg !153

8:                                                ; preds = %7, %0
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !155
  store i32 %9, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !156
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !157
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !158
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !159
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata i8* %1, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32* %2, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 100, i32* %2, align 4, !dbg !165
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !166
  %13 = load i32, i32* %2, align 4, !dbg !168
  %14 = icmp sge i32 %12, %13, !dbg !169
  br i1 %14, label %15, label %22, !dbg !170

15:                                               ; preds = %8
  %16 = load i8, i8* %1, align 1, !dbg !171
  %17 = trunc i8 %16 to i1, !dbg !171
  br i1 %17, label %18, label %19, !dbg !174

18:                                               ; preds = %15
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !175
  br label %21, !dbg !177

19:                                               ; preds = %15
  %20 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !178
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !180
  br label %21

21:                                               ; preds = %19, %18
  br label %24, !dbg !181

22:                                               ; preds = %8
  %23 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !182
  store i32 %23, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !184
  br label %24

24:                                               ; preds = %22, %21
  %25 = load i32, i32* @RT1_Buffer0, align 4, !dbg !185
  store i32 %25, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_2() #0 !dbg !188 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = load i32, i32* @cnt3, align 4, !dbg !189
  %6 = add nsw i32 %5, 1, !dbg !189
  store i32 %6, i32* @cnt3, align 4, !dbg !189
  store i32 0, i32* @test, align 4, !dbg !190
  %7 = load i32, i32* @test, align 4, !dbg !191
  %8 = icmp ne i32 %7, 0, !dbg !193
  br i1 %8, label %9, label %10, !dbg !194

9:                                                ; preds = %0
  br label %10, !dbg !195

10:                                               ; preds = %9, %0
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !197
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !198
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !199
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !200
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !201
  store i32 %13, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata i32* %1, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 10, i32* %1, align 4, !dbg !205
  %14 = load i32, i32* @RT_Buffer0, align 4, !dbg !206
  store i32 %14, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !207
  %15 = load i32, i32* @RT4_Buffer0, align 4, !dbg !208
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata i8* %2, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32* %3, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 100, i32* %3, align 4, !dbg !213
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !214
  %17 = load i32, i32* %3, align 4, !dbg !216
  %18 = icmp sge i32 %16, %17, !dbg !217
  br i1 %18, label %19, label %26, !dbg !218

19:                                               ; preds = %10
  %20 = load i8, i8* %2, align 1, !dbg !219
  %21 = trunc i8 %20 to i1, !dbg !219
  br i1 %21, label %22, label %23, !dbg !222

22:                                               ; preds = %19
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !223
  br label %25, !dbg !225

23:                                               ; preds = %19
  %24 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !226
  store i32 %24, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !228
  br label %25

25:                                               ; preds = %23, %22
  br label %28, !dbg !229

26:                                               ; preds = %10
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !230
  store i32 %27, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !232
  br label %28

28:                                               ; preds = %26, %25
  call void @llvm.dbg.declare(metadata i32* %4, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 50, i32* %4, align 4, !dbg !235
  %29 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !236
  %30 = load i32, i32* %4, align 4, !dbg !237
  %31 = add nsw i32 %29, %30, !dbg !238
  store i32 %31, i32* @RT14, align 4, !dbg !239
  %32 = load i32, i32* %1, align 4, !dbg !240
  store i32 %32, i32* @RT12, align 4, !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_3() #0 !dbg !243 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = load i32, i32* @cnt4, align 4, !dbg !244
  %5 = add nsw i32 %4, 1, !dbg !244
  store i32 %5, i32* @cnt4, align 4, !dbg !244
  store i32 0, i32* @test, align 4, !dbg !245
  %6 = load i32, i32* @test, align 4, !dbg !246
  %7 = icmp ne i32 %6, 0, !dbg !248
  br i1 %7, label %8, label %9, !dbg !249

8:                                                ; preds = %0
  br label %9, !dbg !250

9:                                                ; preds = %8, %0
  %10 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !252
  store i32 %10, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !253
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !254
  store i32 %11, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !255
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !256
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata i32* %1, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i8* %2, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %3, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 100, i32* %3, align 4, !dbg !263
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !264
  %14 = load i32, i32* %3, align 4, !dbg !266
  %15 = icmp sge i32 %13, %14, !dbg !267
  br i1 %15, label %16, label %23, !dbg !268

16:                                               ; preds = %9
  %17 = load i8, i8* %2, align 1, !dbg !269
  %18 = trunc i8 %17 to i1, !dbg !269
  br i1 %18, label %19, label %20, !dbg !272

19:                                               ; preds = %16
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !273
  br label %22, !dbg !275

20:                                               ; preds = %16
  %21 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !276
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !278
  br label %22

22:                                               ; preds = %20, %19
  br label %25, !dbg !279

23:                                               ; preds = %9
  %24 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !280
  store i32 %24, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !282
  br label %25

25:                                               ; preds = %23, %22
  %26 = load i32, i32* @RT3_Buffer0, align 4, !dbg !283
  store i32 %26, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !284
  %27 = load i32, i32* %1, align 4, !dbg !285
  store i32 %27, i32* @RT11, align 4, !dbg !286
  ret void, !dbg !287
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @task_RL_Wheel(i8* %0) #0 !dbg !288 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !292, metadata !DIExpression()), !dbg !293
  %13 = load i32, i32* @test, align 4, !dbg !294
  %14 = add nsw i32 %13, 1, !dbg !294
  store i32 %14, i32* @test, align 4, !dbg !294
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !295
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !296
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !297
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !298
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !299
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !300
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !301
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !302
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !303
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !304
  call void @llvm.dbg.declare(metadata i32* %4, metadata !305, metadata !DIExpression()), !dbg !306
  %20 = load i32, i32* @RT_Buffer0, align 4, !dbg !307
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !308
  %21 = load i32, i32* @RT4_Buffer0, align 4, !dbg !309
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !310
  store i32 10, i32* %4, align 4, !dbg !311
  call void @llvm.dbg.declare(metadata i8* %5, metadata !312, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata i32* %6, metadata !314, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata i32* %7, metadata !316, metadata !DIExpression()), !dbg !317
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !318
  %23 = add nsw i32 10, %22, !dbg !319
  store i32 %23, i32* %6, align 4, !dbg !320
  %24 = load i32, i32* %6, align 4, !dbg !321
  %25 = add nsw i32 %24, 10, !dbg !322
  store i32 %25, i32* %7, align 4, !dbg !323
  %26 = load i32, i32* %7, align 4, !dbg !324
  %27 = load i32, i32* %4, align 4, !dbg !325
  %28 = add nsw i32 %26, %27, !dbg !326
  store i32 %28, i32* %7, align 4, !dbg !327
  call void @llvm.dbg.declare(metadata i32* %8, metadata !328, metadata !DIExpression()), !dbg !329
  store i32 100, i32* %8, align 4, !dbg !329
  %29 = load i32, i32* %7, align 4, !dbg !330
  %30 = load i32, i32* %8, align 4, !dbg !332
  %31 = icmp sge i32 %29, %30, !dbg !333
  br i1 %31, label %32, label %33, !dbg !334

32:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !335
  br label %39, !dbg !337

33:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata i32* %9, metadata !338, metadata !DIExpression()), !dbg !340
  store i32 5, i32* %9, align 4, !dbg !340
  %34 = load i32, i32* %7, align 4, !dbg !341
  %35 = load i32, i32* %9, align 4, !dbg !343
  %36 = icmp sle i32 %34, %35, !dbg !344
  br i1 %36, label %37, label %38, !dbg !345

37:                                               ; preds = %33
  store i32 5, i32* %7, align 4, !dbg !346
  br label %38, !dbg !348

38:                                               ; preds = %37, %33
  br label %39

39:                                               ; preds = %38, %32
  call void @llvm.dbg.declare(metadata i32* %10, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 10, i32* %10, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %11, metadata !351, metadata !DIExpression()), !dbg !352
  %40 = load i32, i32* %6, align 4, !dbg !353
  %41 = add nsw i32 10, %40, !dbg !354
  store i32 %41, i32* %11, align 4, !dbg !352
  %42 = load i32, i32* %10, align 4, !dbg !355
  %43 = load i32, i32* %11, align 4, !dbg !357
  %44 = icmp sgt i32 %42, %43, !dbg !358
  br i1 %44, label %45, label %46, !dbg !359

45:                                               ; preds = %39
  store i8 1, i8* %5, align 1, !dbg !360
  br label %47, !dbg !362

46:                                               ; preds = %39
  store i8 0, i8* %5, align 1, !dbg !363
  br label %47

47:                                               ; preds = %46, %45
  call void @llvm.dbg.declare(metadata i32* %12, metadata !365, metadata !DIExpression()), !dbg !366
  store i32 100, i32* %12, align 4, !dbg !366
  %48 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !367
  %49 = load i32, i32* %12, align 4, !dbg !369
  %50 = icmp sge i32 %48, %49, !dbg !370
  br i1 %50, label %51, label %58, !dbg !371

51:                                               ; preds = %47
  %52 = load i8, i8* %5, align 1, !dbg !372
  %53 = trunc i8 %52 to i1, !dbg !372
  br i1 %53, label %54, label %55, !dbg !375

54:                                               ; preds = %51
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !376
  br label %57, !dbg !378

55:                                               ; preds = %51
  %56 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !379
  store i32 %56, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !381
  br label %57

57:                                               ; preds = %55, %54
  br label %60, !dbg !382

58:                                               ; preds = %47
  %59 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !383
  store i32 %59, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !385
  br label %60

60:                                               ; preds = %58, %57
  %61 = load i32, i32* @RT2_Buffer0, align 4, !dbg !386
  store i32 %61, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !387
  %62 = load i32, i32* %4, align 4, !dbg !388
  store i32 %62, i32* @RT10, align 4, !dbg !389
  %63 = load i8*, i8** %2, align 8, !dbg !390
  ret i8* %63, !dbg !390
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_006_001_main() #0 !dbg !391 {
  store i32 0, i32* @test, align 4, !dbg !394
  call void @task_compute(), !dbg !395
  ret i32 0, !dbg !396
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!93, !94, !95, !96, !97}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!98}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh", scope: !2, file: !3, line: 134, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "brake3.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP/brake")
!4 = !{}
!5 = !{!0, !6, !9, !11, !13, !15, !17, !19, !21, !23, !25, !27, !29, !31, !33, !35, !37, !39, !41, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !79, !81, !83, !85, !87, !89, !91}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh", scope: !2, file: !3, line: 135, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh", scope: !2, file: !3, line: 136, type: !8, isLocal: false, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh", scope: !2, file: !3, line: 137, type: !8, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT_h", scope: !2, file: !3, line: 126, type: !8, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RTH", scope: !2, file: !3, line: 127, type: !8, isLocal: false, isDefinition: true)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT4", scope: !2, file: !3, line: 128, type: !8, isLocal: false, isDefinition: true)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT1", scope: !2, file: !3, line: 129, type: !8, isLocal: false, isDefinition: true)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT2", scope: !2, file: !3, line: 130, type: !8, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT3", scope: !2, file: !3, line: 131, type: !8, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT14", scope: !2, file: !3, line: 132, type: !8, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT_X0", scope: !2, file: !3, line: 139, type: !8, isLocal: false, isDefinition: true)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT4_X0", scope: !2, file: !3, line: 140, type: !8, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT1_X0", scope: !2, file: !3, line: 141, type: !8, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT2_X0", scope: !2, file: !3, line: 142, type: !8, isLocal: false, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT3_X0", scope: !2, file: !3, line: 143, type: !8, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Gain1_Gain", scope: !2, file: !3, line: 145, type: !8, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain0", scope: !2, file: !3, line: 147, type: !8, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain1", scope: !2, file: !3, line: 148, type: !8, isLocal: false, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain2", scope: !2, file: !3, line: 149, type: !8, isLocal: false, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain3", scope: !2, file: !3, line: 150, type: !8, isLocal: false, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_average_rpm_Gain", scope: !2, file: !3, line: 153, type: !8, isLocal: false, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_wgrads_Gain", scope: !2, file: !3, line: 154, type: !8, isLocal: false, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_vkmh_Gain", scope: !2, file: !3, line: 155, type: !8, isLocal: false, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "vkmh", scope: !2, file: !3, line: 202, type: !8, isLocal: false, isDefinition: true)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(name: "test", scope: !2, file: !3, line: 203, type: !8, isLocal: false, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "RT9", scope: !2, file: !3, line: 205, type: !8, isLocal: false, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "RT10", scope: !2, file: !3, line: 206, type: !8, isLocal: false, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "RT11", scope: !2, file: !3, line: 207, type: !8, isLocal: false, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "RT12", scope: !2, file: !3, line: 208, type: !8, isLocal: false, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "RT14", scope: !2, file: !3, line: 209, type: !8, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "RT_Buffer0", scope: !2, file: !3, line: 211, type: !8, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "RT0_Buffer0", scope: !2, file: !3, line: 212, type: !8, isLocal: false, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "RT1_Buffer0", scope: !2, file: !3, line: 213, type: !8, isLocal: false, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "RT2_Buffer0", scope: !2, file: !3, line: 214, type: !8, isLocal: false, isDefinition: true)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "RT3_Buffer0", scope: !2, file: !3, line: 215, type: !8, isLocal: false, isDefinition: true)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(name: "RT4_Buffer0", scope: !2, file: !3, line: 216, type: !8, isLocal: false, isDefinition: true)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(name: "Distribution_idx", scope: !2, file: !3, line: 218, type: !8, isLocal: false, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Distribution_idx_0", scope: !2, file: !3, line: 219, type: !8, isLocal: false, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(name: "Distribution_idx_1", scope: !2, file: !3, line: 220, type: !8, isLocal: false, isDefinition: true)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !3, line: 223, type: !8, isLocal: false, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !3, line: 223, type: !8, isLocal: false, isDefinition: true)
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !3, line: 223, type: !8, isLocal: false, isDefinition: true)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(name: "cnt4", scope: !2, file: !3, line: 223, type: !8, isLocal: false, isDefinition: true)
!93 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!94 = !{i32 7, !"Dwarf Version", i32 4}
!95 = !{i32 2, !"Debug Info Version", i32 3}
!96 = !{i32 1, !"wchar_size", i32 4}
!97 = !{i32 7, !"PIC Level", i32 2}
!98 = !{!"clang version 10.0.0 "}
!99 = distinct !DISubprogram(name: "task_compute", scope: !3, file: !3, line: 226, type: !100, scopeLine: 226, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{null}
!102 = !DILocation(line: 231, column: 14, scope: !99)
!103 = !DILocation(line: 235, column: 41, scope: !99)
!104 = !DILocation(line: 235, column: 39, scope: !99)
!105 = !DILocation(line: 238, column: 40, scope: !99)
!106 = !DILocation(line: 238, column: 38, scope: !99)
!107 = !DILocation(line: 250, column: 10, scope: !99)
!108 = !DILocation(line: 258, column: 24, scope: !99)
!109 = !DILocation(line: 259, column: 9, scope: !99)
!110 = !DILocation(line: 258, column: 66, scope: !99)
!111 = !DILocation(line: 258, column: 22, scope: !99)
!112 = !DILocation(line: 260, column: 26, scope: !99)
!113 = !DILocation(line: 261, column: 9, scope: !99)
!114 = !DILocation(line: 260, column: 68, scope: !99)
!115 = !DILocation(line: 260, column: 24, scope: !99)
!116 = !DILocation(line: 262, column: 26, scope: !99)
!117 = !DILocation(line: 263, column: 9, scope: !99)
!118 = !DILocation(line: 262, column: 68, scope: !99)
!119 = !DILocation(line: 262, column: 24, scope: !99)
!120 = !DILocation(line: 277, column: 12, scope: !99)
!121 = !DILocation(line: 277, column: 16, scope: !99)
!122 = !DILocation(line: 277, column: 15, scope: !99)
!123 = !DILocation(line: 277, column: 10, scope: !99)
!124 = !DILocation(line: 285, column: 9, scope: !99)
!125 = !DILocation(line: 288, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !99, file: !3, line: 288, column: 9)
!127 = !DILocation(line: 288, column: 14, scope: !126)
!128 = !DILocation(line: 288, column: 9, scope: !99)
!129 = !DILocation(line: 290, column: 5, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 288, column: 20)
!131 = !DILocation(line: 293, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !99, file: !3, line: 293, column: 9)
!133 = !DILocation(line: 293, column: 14, scope: !132)
!134 = !DILocation(line: 293, column: 9, scope: !99)
!135 = !DILocation(line: 295, column: 5, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !3, line: 293, column: 20)
!137 = !DILocation(line: 311, column: 19, scope: !99)
!138 = !DILocation(line: 311, column: 17, scope: !99)
!139 = !DILocation(line: 314, column: 19, scope: !99)
!140 = !DILocation(line: 314, column: 17, scope: !99)
!141 = !DILocation(line: 317, column: 19, scope: !99)
!142 = !DILocation(line: 317, column: 17, scope: !99)
!143 = !DILocation(line: 320, column: 19, scope: !99)
!144 = !DILocation(line: 320, column: 17, scope: !99)
!145 = !DILocation(line: 323, column: 1, scope: !99)
!146 = distinct !DISubprogram(name: "task_isr_1", scope: !3, file: !3, line: 325, type: !100, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!147 = !DILocation(line: 330, column: 14, scope: !146)
!148 = !DILocation(line: 331, column: 10, scope: !146)
!149 = !DILocation(line: 334, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 334, column: 9)
!151 = !DILocation(line: 334, column: 14, scope: !150)
!152 = !DILocation(line: 334, column: 9, scope: !146)
!153 = !DILocation(line: 336, column: 5, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 334, column: 20)
!155 = !DILocation(line: 339, column: 41, scope: !146)
!156 = !DILocation(line: 339, column: 39, scope: !146)
!157 = !DILocation(line: 341, column: 40, scope: !146)
!158 = !DILocation(line: 341, column: 38, scope: !146)
!159 = !DILocation(line: 343, column: 40, scope: !146)
!160 = !DILocation(line: 343, column: 38, scope: !146)
!161 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !146, file: !3, line: 361, type: !162)
!162 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!163 = !DILocation(line: 361, column: 10, scope: !146)
!164 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !146, file: !3, line: 396, type: !8)
!165 = !DILocation(line: 396, column: 9, scope: !146)
!166 = !DILocation(line: 397, column: 9, scope: !167)
!167 = distinct !DILexicalBlock(scope: !146, file: !3, line: 397, column: 9)
!168 = !DILocation(line: 397, column: 45, scope: !167)
!169 = !DILocation(line: 397, column: 42, scope: !167)
!170 = !DILocation(line: 397, column: 9, scope: !146)
!171 = !DILocation(line: 403, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !173, file: !3, line: 403, column: 13)
!173 = distinct !DILexicalBlock(scope: !167, file: !3, line: 397, column: 78)
!174 = !DILocation(line: 403, column: 13, scope: !173)
!175 = !DILocation(line: 404, column: 71, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !3, line: 403, column: 37)
!177 = !DILocation(line: 405, column: 9, scope: !176)
!178 = !DILocation(line: 406, column: 73, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !3, line: 405, column: 16)
!180 = !DILocation(line: 406, column: 71, scope: !179)
!181 = !DILocation(line: 409, column: 5, scope: !173)
!182 = !DILocation(line: 412, column: 69, scope: !183)
!183 = distinct !DILexicalBlock(scope: !167, file: !3, line: 409, column: 12)
!184 = !DILocation(line: 412, column: 67, scope: !183)
!185 = !DILocation(line: 421, column: 40, scope: !146)
!186 = !DILocation(line: 421, column: 38, scope: !146)
!187 = !DILocation(line: 430, column: 1, scope: !146)
!188 = distinct !DISubprogram(name: "task_isr_2", scope: !3, file: !3, line: 432, type: !100, scopeLine: 432, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocation(line: 438, column: 13, scope: !188)
!190 = !DILocation(line: 439, column: 10, scope: !188)
!191 = !DILocation(line: 442, column: 9, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !3, line: 442, column: 9)
!193 = !DILocation(line: 442, column: 14, scope: !192)
!194 = !DILocation(line: 442, column: 9, scope: !188)
!195 = !DILocation(line: 444, column: 5, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 442, column: 20)
!197 = !DILocation(line: 448, column: 41, scope: !188)
!198 = !DILocation(line: 448, column: 39, scope: !188)
!199 = !DILocation(line: 450, column: 40, scope: !188)
!200 = !DILocation(line: 450, column: 38, scope: !188)
!201 = !DILocation(line: 452, column: 40, scope: !188)
!202 = !DILocation(line: 452, column: 38, scope: !188)
!203 = !DILocalVariable(name: "rtb_to_int1", scope: !188, file: !3, line: 457, type: !8)
!204 = !DILocation(line: 457, column: 9, scope: !188)
!205 = !DILocation(line: 462, column: 17, scope: !188)
!206 = !DILocation(line: 464, column: 45, scope: !188)
!207 = !DILocation(line: 464, column: 43, scope: !188)
!208 = !DILocation(line: 466, column: 40, scope: !188)
!209 = !DILocation(line: 466, column: 38, scope: !188)
!210 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !188, file: !3, line: 477, type: !162)
!211 = !DILocation(line: 477, column: 10, scope: !188)
!212 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !188, file: !3, line: 517, type: !8)
!213 = !DILocation(line: 517, column: 9, scope: !188)
!214 = !DILocation(line: 518, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !188, file: !3, line: 518, column: 9)
!216 = !DILocation(line: 518, column: 45, scope: !215)
!217 = !DILocation(line: 518, column: 42, scope: !215)
!218 = !DILocation(line: 518, column: 9, scope: !188)
!219 = !DILocation(line: 523, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !221, file: !3, line: 523, column: 13)
!221 = distinct !DILexicalBlock(scope: !215, file: !3, line: 518, column: 78)
!222 = !DILocation(line: 523, column: 13, scope: !221)
!223 = !DILocation(line: 524, column: 71, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !3, line: 523, column: 37)
!225 = !DILocation(line: 525, column: 9, scope: !224)
!226 = !DILocation(line: 526, column: 73, scope: !227)
!227 = distinct !DILexicalBlock(scope: !220, file: !3, line: 525, column: 16)
!228 = !DILocation(line: 526, column: 71, scope: !227)
!229 = !DILocation(line: 529, column: 5, scope: !221)
!230 = !DILocation(line: 532, column: 69, scope: !231)
!231 = distinct !DILexicalBlock(scope: !215, file: !3, line: 529, column: 12)
!232 = !DILocation(line: 532, column: 67, scope: !231)
!233 = !DILocalVariable(name: "tmp", scope: !188, file: !3, line: 552, type: !8)
!234 = !DILocation(line: 552, column: 9, scope: !188)
!235 = !DILocation(line: 554, column: 13, scope: !188)
!236 = !DILocation(line: 565, column: 12, scope: !188)
!237 = !DILocation(line: 565, column: 48, scope: !188)
!238 = !DILocation(line: 565, column: 46, scope: !188)
!239 = !DILocation(line: 565, column: 10, scope: !188)
!240 = !DILocation(line: 567, column: 12, scope: !188)
!241 = !DILocation(line: 567, column: 10, scope: !188)
!242 = !DILocation(line: 569, column: 1, scope: !188)
!243 = distinct !DISubprogram(name: "task_isr_3", scope: !3, file: !3, line: 571, type: !100, scopeLine: 572, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!244 = !DILocation(line: 574, column: 13, scope: !243)
!245 = !DILocation(line: 575, column: 10, scope: !243)
!246 = !DILocation(line: 578, column: 9, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !3, line: 578, column: 9)
!248 = !DILocation(line: 578, column: 14, scope: !247)
!249 = !DILocation(line: 578, column: 9, scope: !243)
!250 = !DILocation(line: 580, column: 5, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 578, column: 20)
!252 = !DILocation(line: 584, column: 41, scope: !243)
!253 = !DILocation(line: 584, column: 39, scope: !243)
!254 = !DILocation(line: 586, column: 40, scope: !243)
!255 = !DILocation(line: 586, column: 38, scope: !243)
!256 = !DILocation(line: 588, column: 40, scope: !243)
!257 = !DILocation(line: 588, column: 38, scope: !243)
!258 = !DILocalVariable(name: "rtb_to_int_k", scope: !243, file: !3, line: 596, type: !8)
!259 = !DILocation(line: 596, column: 9, scope: !243)
!260 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !243, file: !3, line: 614, type: !162)
!261 = !DILocation(line: 614, column: 10, scope: !243)
!262 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !243, file: !3, line: 652, type: !8)
!263 = !DILocation(line: 652, column: 9, scope: !243)
!264 = !DILocation(line: 653, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !243, file: !3, line: 653, column: 9)
!266 = !DILocation(line: 653, column: 45, scope: !265)
!267 = !DILocation(line: 653, column: 42, scope: !265)
!268 = !DILocation(line: 653, column: 9, scope: !243)
!269 = !DILocation(line: 658, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !3, line: 658, column: 13)
!271 = distinct !DILexicalBlock(scope: !265, file: !3, line: 653, column: 78)
!272 = !DILocation(line: 658, column: 13, scope: !271)
!273 = !DILocation(line: 659, column: 71, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !3, line: 658, column: 37)
!275 = !DILocation(line: 660, column: 9, scope: !274)
!276 = !DILocation(line: 661, column: 73, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !3, line: 660, column: 16)
!278 = !DILocation(line: 661, column: 71, scope: !277)
!279 = !DILocation(line: 664, column: 5, scope: !271)
!280 = !DILocation(line: 667, column: 69, scope: !281)
!281 = distinct !DILexicalBlock(scope: !265, file: !3, line: 664, column: 12)
!282 = !DILocation(line: 667, column: 67, scope: !281)
!283 = !DILocation(line: 677, column: 40, scope: !243)
!284 = !DILocation(line: 677, column: 38, scope: !243)
!285 = !DILocation(line: 680, column: 12, scope: !243)
!286 = !DILocation(line: 680, column: 10, scope: !243)
!287 = !DILocation(line: 682, column: 1, scope: !243)
!288 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !3, file: !3, line: 684, type: !289, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!289 = !DISubroutineType(types: !290)
!290 = !{!291, !291}
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!292 = !DILocalVariable(name: "unused", arg: 1, scope: !288, file: !3, line: 684, type: !291)
!293 = !DILocation(line: 684, column: 27, scope: !288)
!294 = !DILocation(line: 686, column: 10, scope: !288)
!295 = !DILocation(line: 690, column: 41, scope: !288)
!296 = !DILocation(line: 690, column: 39, scope: !288)
!297 = !DILocation(line: 692, column: 40, scope: !288)
!298 = !DILocation(line: 692, column: 38, scope: !288)
!299 = !DILocation(line: 694, column: 40, scope: !288)
!300 = !DILocation(line: 694, column: 38, scope: !288)
!301 = !DILocation(line: 696, column: 40, scope: !288)
!302 = !DILocation(line: 696, column: 38, scope: !288)
!303 = !DILocation(line: 698, column: 40, scope: !288)
!304 = !DILocation(line: 698, column: 38, scope: !288)
!305 = !DILocalVariable(name: "rtb_to_int_g", scope: !288, file: !3, line: 702, type: !8)
!306 = !DILocation(line: 702, column: 9, scope: !288)
!307 = !DILocation(line: 704, column: 41, scope: !288)
!308 = !DILocation(line: 704, column: 39, scope: !288)
!309 = !DILocation(line: 706, column: 40, scope: !288)
!310 = !DILocation(line: 706, column: 38, scope: !288)
!311 = !DILocation(line: 708, column: 15, scope: !288)
!312 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !288, file: !3, line: 710, type: !162)
!313 = !DILocation(line: 710, column: 10, scope: !288)
!314 = !DILocalVariable(name: "rtb_vms", scope: !288, file: !3, line: 711, type: !8)
!315 = !DILocation(line: 711, column: 9, scope: !288)
!316 = !DILocalVariable(name: "u", scope: !288, file: !3, line: 712, type: !8)
!317 = !DILocation(line: 712, column: 9, scope: !288)
!318 = !DILocation(line: 713, column: 62, scope: !288)
!319 = !DILocation(line: 713, column: 60, scope: !288)
!320 = !DILocation(line: 713, column: 13, scope: !288)
!321 = !DILocation(line: 715, column: 9, scope: !288)
!322 = !DILocation(line: 715, column: 17, scope: !288)
!323 = !DILocation(line: 715, column: 7, scope: !288)
!324 = !DILocation(line: 716, column: 9, scope: !288)
!325 = !DILocation(line: 716, column: 13, scope: !288)
!326 = !DILocation(line: 716, column: 11, scope: !288)
!327 = !DILocation(line: 716, column: 7, scope: !288)
!328 = !DILocalVariable(name: "positive_UpperSat_local", scope: !288, file: !3, line: 718, type: !8)
!329 = !DILocation(line: 718, column: 9, scope: !288)
!330 = !DILocation(line: 720, column: 9, scope: !331)
!331 = distinct !DILexicalBlock(scope: !288, file: !3, line: 720, column: 9)
!332 = !DILocation(line: 720, column: 14, scope: !331)
!333 = !DILocation(line: 720, column: 11, scope: !331)
!334 = !DILocation(line: 720, column: 9, scope: !288)
!335 = !DILocation(line: 721, column: 11, scope: !336)
!336 = distinct !DILexicalBlock(scope: !331, file: !3, line: 720, column: 39)
!337 = !DILocation(line: 722, column: 5, scope: !336)
!338 = !DILocalVariable(name: "positive_LowerSat_local", scope: !339, file: !3, line: 723, type: !8)
!339 = distinct !DILexicalBlock(scope: !331, file: !3, line: 722, column: 12)
!340 = !DILocation(line: 723, column: 13, scope: !339)
!341 = !DILocation(line: 724, column: 13, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !3, line: 724, column: 13)
!343 = !DILocation(line: 724, column: 18, scope: !342)
!344 = !DILocation(line: 724, column: 15, scope: !342)
!345 = !DILocation(line: 724, column: 13, scope: !339)
!346 = !DILocation(line: 725, column: 15, scope: !347)
!347 = distinct !DILexicalBlock(scope: !342, file: !3, line: 724, column: 43)
!348 = !DILocation(line: 726, column: 9, scope: !347)
!349 = !DILocalVariable(name: "tmp0", scope: !288, file: !3, line: 736, type: !8)
!350 = !DILocation(line: 736, column: 9, scope: !288)
!351 = !DILocalVariable(name: "tmp1", scope: !288, file: !3, line: 737, type: !8)
!352 = !DILocation(line: 737, column: 9, scope: !288)
!353 = !DILocation(line: 737, column: 80, scope: !288)
!354 = !DILocation(line: 737, column: 78, scope: !288)
!355 = !DILocation(line: 738, column: 9, scope: !356)
!356 = distinct !DILexicalBlock(scope: !288, file: !3, line: 738, column: 9)
!357 = !DILocation(line: 738, column: 16, scope: !356)
!358 = !DILocation(line: 738, column: 14, scope: !356)
!359 = !DILocation(line: 738, column: 9, scope: !288)
!360 = !DILocation(line: 739, column: 32, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !3, line: 738, column: 22)
!362 = !DILocation(line: 740, column: 5, scope: !361)
!363 = !DILocation(line: 741, column: 32, scope: !364)
!364 = distinct !DILexicalBlock(scope: !356, file: !3, line: 740, column: 12)
!365 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !288, file: !3, line: 746, type: !8)
!366 = !DILocation(line: 746, column: 9, scope: !288)
!367 = !DILocation(line: 747, column: 9, scope: !368)
!368 = distinct !DILexicalBlock(scope: !288, file: !3, line: 747, column: 9)
!369 = !DILocation(line: 747, column: 45, scope: !368)
!370 = !DILocation(line: 747, column: 42, scope: !368)
!371 = !DILocation(line: 747, column: 9, scope: !288)
!372 = !DILocation(line: 752, column: 13, scope: !373)
!373 = distinct !DILexicalBlock(scope: !374, file: !3, line: 752, column: 13)
!374 = distinct !DILexicalBlock(scope: !368, file: !3, line: 747, column: 78)
!375 = !DILocation(line: 752, column: 13, scope: !374)
!376 = !DILocation(line: 753, column: 71, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !3, line: 752, column: 37)
!378 = !DILocation(line: 754, column: 9, scope: !377)
!379 = !DILocation(line: 755, column: 73, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !3, line: 754, column: 16)
!381 = !DILocation(line: 755, column: 71, scope: !380)
!382 = !DILocation(line: 759, column: 5, scope: !374)
!383 = !DILocation(line: 762, column: 69, scope: !384)
!384 = distinct !DILexicalBlock(scope: !368, file: !3, line: 759, column: 12)
!385 = !DILocation(line: 762, column: 67, scope: !384)
!386 = !DILocation(line: 773, column: 40, scope: !288)
!387 = !DILocation(line: 773, column: 38, scope: !288)
!388 = !DILocation(line: 776, column: 12, scope: !288)
!389 = !DILocation(line: 776, column: 10, scope: !288)
!390 = !DILocation(line: 777, column: 1, scope: !288)
!391 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !3, file: !3, line: 785, type: !392, scopeLine: 786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!392 = !DISubroutineType(types: !393)
!393 = !{!8}
!394 = !DILocation(line: 789, column: 10, scope: !391)
!395 = !DILocation(line: 792, column: 5, scope: !391)
!396 = !DILocation(line: 801, column: 5, scope: !391)
