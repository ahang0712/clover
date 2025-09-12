; ModuleID = './brake/brake1.c'
source_filename = "./brake/brake1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !0
@brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !6
@brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !10
@brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh = global i32 100, align 4, !dbg !12
@cnt1 = common global i32 0, align 4, !dbg !86
@brake_acc_nodiv_ctrl_P_RT_X0 = common global i32 0, align 4, !dbg !28
@brake_acc_nodiv_ctrl_B_local_RT_h = common global i32 0, align 4, !dbg !14
@brake_acc_nodiv_ctrl_P_RT4_X0 = common global i32 0, align 4, !dbg !30
@brake_acc_nodiv_ctrl_B_local_RT4 = common global i32 0, align 4, !dbg !18
@brake_acc_nodiv_ctrl_P_RT1_X0 = common global i32 0, align 4, !dbg !32
@brake_acc_nodiv_ctrl_B_local_RT1 = common global i32 0, align 4, !dbg !20
@brake_acc_nodiv_ctrl_P_RT2_X0 = common global i32 0, align 4, !dbg !34
@brake_acc_nodiv_ctrl_B_local_RT2 = common global i32 0, align 4, !dbg !22
@brake_acc_nodiv_ctrl_P_RT3_X0 = common global i32 0, align 4, !dbg !36
@brake_acc_nodiv_ctrl_B_local_RT3 = common global i32 0, align 4, !dbg !24
@test = common global i32 0, align 4, !dbg !56
@brake_acc_nodiv_ctrl_P_Distribution_Gain1 = common global i32 0, align 4, !dbg !42
@brake_acc_nodiv_ctrl_B_local_RT14 = common global i32 0, align 4, !dbg !26
@Distribution_idx = common global i32 0, align 4, !dbg !80
@brake_acc_nodiv_ctrl_P_Distribution_Gain2 = common global i32 0, align 4, !dbg !44
@Distribution_idx_0 = common global i32 0, align 4, !dbg !82
@brake_acc_nodiv_ctrl_P_Distribution_Gain3 = common global i32 0, align 4, !dbg !46
@Distribution_idx_1 = common global i32 0, align 4, !dbg !84
@RT9 = common global i32 0, align 4, !dbg !58
@RT10 = common global i32 0, align 4, !dbg !60
@vkmh = common global i32 0, align 4, !dbg !54
@RT11 = common global i32 0, align 4, !dbg !62
@RT12 = common global i32 0, align 4, !dbg !64
@brake_acc_nodiv_ctrl_P_average_rpm_Gain = common global i32 0, align 4, !dbg !48
@brake_acc_nodiv_ctrl_P_wgrads_Gain = common global i32 0, align 4, !dbg !50
@brake_acc_nodiv_ctrl_P_vkmh_Gain = common global i32 0, align 4, !dbg !52
@brake_acc_nodiv_ctrl_P_Distribution_Gain0 = common global i32 0, align 4, !dbg !40
@RT_Buffer0 = common global i32 0, align 4, !dbg !68
@RT4_Buffer0 = common global i32 0, align 4, !dbg !78
@RT1_Buffer0 = common global i32 0, align 4, !dbg !72
@RT2_Buffer0 = common global i32 0, align 4, !dbg !74
@RT3_Buffer0 = common global i32 0, align 4, !dbg !76
@cnt2 = common global i32 0, align 4, !dbg !88
@brake_acc_nodiv_ctrl_P_Gain1_Gain = common global i32 0, align 4, !dbg !38
@RT14 = common global i32 0, align 4, !dbg !66
@brake_acc_nodiv_ctrl_B_local_RTH = common global i32 0, align 4, !dbg !16
@RT0_Buffer0 = common global i32 0, align 4, !dbg !70
@cnt3 = common global i32 0, align 4, !dbg !90

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_1() #0 !dbg !98 {
  %1 = load i32, i32* @cnt1, align 4, !dbg !101
  %2 = add nsw i32 %1, 1, !dbg !101
  store i32 %2, i32* @cnt1, align 4, !dbg !101
  %3 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !102
  store i32 %3, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !103
  %4 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !104
  store i32 %4, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !105
  %5 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !106
  store i32 %5, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !107
  %6 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !108
  store i32 %6, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !109
  %7 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !110
  store i32 %7, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !111
  store i32 0, i32* @test, align 4, !dbg !112
  %8 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain1, align 4, !dbg !113
  %9 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !114
  %10 = add nsw i32 %8, %9, !dbg !115
  store i32 %10, i32* @Distribution_idx, align 4, !dbg !116
  %11 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain2, align 4, !dbg !117
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !118
  %13 = add nsw i32 %11, %12, !dbg !119
  store i32 %13, i32* @Distribution_idx_0, align 4, !dbg !120
  %14 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain3, align 4, !dbg !121
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !122
  %16 = add nsw i32 %14, %15, !dbg !123
  store i32 %16, i32* @Distribution_idx_1, align 4, !dbg !124
  %17 = load i32, i32* @RT9, align 4, !dbg !125
  %18 = load i32, i32* @RT10, align 4, !dbg !126
  %19 = add nsw i32 %17, %18, !dbg !127
  store i32 %19, i32* @vkmh, align 4, !dbg !128
  %20 = load i32, i32* @vkmh, align 4, !dbg !129
  %21 = load i32, i32* @RT11, align 4, !dbg !130
  %22 = add nsw i32 %20, %21, !dbg !131
  store i32 %22, i32* @vkmh, align 4, !dbg !132
  %23 = load i32, i32* @vkmh, align 4, !dbg !133
  %24 = load i32, i32* @RT12, align 4, !dbg !134
  %25 = add nsw i32 %23, %24, !dbg !135
  store i32 %25, i32* @vkmh, align 4, !dbg !136
  %26 = load i32, i32* @vkmh, align 4, !dbg !137
  %27 = load i32, i32* @brake_acc_nodiv_ctrl_P_average_rpm_Gain, align 4, !dbg !138
  %28 = add nsw i32 %26, %27, !dbg !139
  store i32 %28, i32* @vkmh, align 4, !dbg !140
  %29 = load i32, i32* @vkmh, align 4, !dbg !141
  %30 = load i32, i32* @brake_acc_nodiv_ctrl_P_wgrads_Gain, align 4, !dbg !142
  %31 = add nsw i32 %29, %30, !dbg !143
  store i32 %31, i32* @vkmh, align 4, !dbg !144
  %32 = load i32, i32* @vkmh, align 4, !dbg !145
  %33 = load i32, i32* @brake_acc_nodiv_ctrl_P_vkmh_Gain, align 4, !dbg !146
  %34 = add nsw i32 %32, %33, !dbg !147
  store i32 %34, i32* @vkmh, align 4, !dbg !148
  %35 = load i32, i32* @test, align 4, !dbg !149
  %36 = icmp ne i32 %35, 0, !dbg !151
  br i1 %36, label %37, label %38, !dbg !152

37:                                               ; preds = %0
  br label %38, !dbg !153

38:                                               ; preds = %37, %0
  %39 = load i32, i32* @test, align 4, !dbg !155
  %40 = icmp ne i32 %39, 1, !dbg !157
  br i1 %40, label %41, label %42, !dbg !158

41:                                               ; preds = %38
  br label %42, !dbg !159

42:                                               ; preds = %41, %38
  %43 = load i32, i32* @test, align 4, !dbg !161
  %44 = icmp ne i32 %43, 2, !dbg !163
  br i1 %44, label %45, label %46, !dbg !164

45:                                               ; preds = %42
  br label %46, !dbg !165

46:                                               ; preds = %45, %42
  %47 = load i32, i32* @test, align 4, !dbg !167
  %48 = icmp ne i32 %47, 3, !dbg !169
  br i1 %48, label %49, label %50, !dbg !170

49:                                               ; preds = %46
  br label %50, !dbg !171

50:                                               ; preds = %49, %46
  %51 = load i32, i32* @test, align 4, !dbg !173
  %52 = icmp sle i32 %51, 0, !dbg !175
  br i1 %52, label %53, label %54, !dbg !176

53:                                               ; preds = %50
  br label %54, !dbg !177

54:                                               ; preds = %53, %50
  %55 = load i32, i32* @test, align 4, !dbg !179
  %56 = add nsw i32 %55, 1, !dbg !179
  store i32 %56, i32* @test, align 4, !dbg !179
  %57 = load i32, i32* @brake_acc_nodiv_ctrl_P_Distribution_Gain0, align 4, !dbg !180
  %58 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT14, align 4, !dbg !181
  %59 = add nsw i32 %57, %58, !dbg !182
  store i32 %59, i32* @RT_Buffer0, align 4, !dbg !183
  %60 = load i32, i32* @vkmh, align 4, !dbg !184
  store i32 %60, i32* @RT4_Buffer0, align 4, !dbg !185
  %61 = load i32, i32* @Distribution_idx, align 4, !dbg !186
  store i32 %61, i32* @RT1_Buffer0, align 4, !dbg !187
  %62 = load i32, i32* @Distribution_idx_0, align 4, !dbg !188
  store i32 %62, i32* @RT2_Buffer0, align 4, !dbg !189
  %63 = load i32, i32* @Distribution_idx_1, align 4, !dbg !190
  store i32 %63, i32* @RT3_Buffer0, align 4, !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @task_isr_2() #0 !dbg !193 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = load i32, i32* @cnt2, align 4, !dbg !194
  %11 = add nsw i32 %10, 1, !dbg !194
  store i32 %11, i32* @cnt2, align 4, !dbg !194
  store i32 1, i32* @test, align 4, !dbg !195
  %12 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !196
  store i32 %12, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !197
  %13 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !198
  store i32 %13, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !199
  %14 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !200
  store i32 %14, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !201
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !202
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !203
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !204
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !205
  call void @llvm.dbg.declare(metadata i32* %1, metadata !206, metadata !DIExpression()), !dbg !207
  %17 = load i32, i32* @RT_Buffer0, align 4, !dbg !208
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !209
  %18 = load i32, i32* @RT4_Buffer0, align 4, !dbg !210
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !211
  store i32 10, i32* %1, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i8* %2, metadata !213, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32* %3, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %4, metadata !218, metadata !DIExpression()), !dbg !219
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !220
  %20 = add nsw i32 10, %19, !dbg !221
  store i32 %20, i32* %3, align 4, !dbg !222
  %21 = load i32, i32* %3, align 4, !dbg !223
  %22 = add nsw i32 %21, 10, !dbg !224
  store i32 %22, i32* %4, align 4, !dbg !225
  %23 = load i32, i32* %4, align 4, !dbg !226
  %24 = load i32, i32* %1, align 4, !dbg !227
  %25 = add nsw i32 %23, %24, !dbg !228
  store i32 %25, i32* %4, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata i32* %5, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 100, i32* %5, align 4, !dbg !231
  %26 = load i32, i32* %4, align 4, !dbg !232
  %27 = load i32, i32* %5, align 4, !dbg !234
  %28 = icmp sge i32 %26, %27, !dbg !235
  br i1 %28, label %29, label %30, !dbg !236

29:                                               ; preds = %0
  store i32 100, i32* %4, align 4, !dbg !237
  br label %36, !dbg !239

30:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata i32* %6, metadata !240, metadata !DIExpression()), !dbg !242
  store i32 5, i32* %6, align 4, !dbg !242
  %31 = load i32, i32* %4, align 4, !dbg !243
  %32 = load i32, i32* %6, align 4, !dbg !245
  %33 = icmp sle i32 %31, %32, !dbg !246
  br i1 %33, label %34, label %35, !dbg !247

34:                                               ; preds = %30
  store i32 5, i32* %4, align 4, !dbg !248
  br label %35, !dbg !250

35:                                               ; preds = %34, %30
  br label %36

36:                                               ; preds = %35, %29
  call void @llvm.dbg.declare(metadata i32* %7, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 10, i32* %7, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata i32* %8, metadata !253, metadata !DIExpression()), !dbg !254
  %37 = load i32, i32* %3, align 4, !dbg !255
  %38 = add nsw i32 10, %37, !dbg !256
  store i32 %38, i32* %8, align 4, !dbg !254
  %39 = load i32, i32* %7, align 4, !dbg !257
  %40 = load i32, i32* %8, align 4, !dbg !259
  %41 = icmp sgt i32 %39, %40, !dbg !260
  br i1 %41, label %42, label %43, !dbg !261

42:                                               ; preds = %36
  store i8 1, i8* %2, align 1, !dbg !262
  br label %44, !dbg !264

43:                                               ; preds = %36
  store i8 0, i8* %2, align 1, !dbg !265
  br label %44

44:                                               ; preds = %43, %42
  call void @llvm.dbg.declare(metadata i32* %9, metadata !267, metadata !DIExpression()), !dbg !268
  store i32 100, i32* %9, align 4, !dbg !268
  %45 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !269
  %46 = load i32, i32* %9, align 4, !dbg !271
  %47 = icmp sge i32 %45, %46, !dbg !272
  br i1 %47, label %48, label %55, !dbg !273

48:                                               ; preds = %44
  %49 = load i8, i8* %2, align 1, !dbg !274
  %50 = trunc i8 %49 to i1, !dbg !274
  br i1 %50, label %51, label %52, !dbg !277

51:                                               ; preds = %48
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !278
  br label %54, !dbg !280

52:                                               ; preds = %48
  %53 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !281
  store i32 %53, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !283
  br label %54

54:                                               ; preds = %52, %51
  br label %57, !dbg !284

55:                                               ; preds = %44
  %56 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !285
  store i32 %56, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh, align 4, !dbg !287
  br label %57

57:                                               ; preds = %55, %54
  %58 = load i32, i32* @RT1_Buffer0, align 4, !dbg !288
  store i32 %58, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !289
  %59 = load i32, i32* %1, align 4, !dbg !290
  store i32 %59, i32* @RT9, align 4, !dbg !291
  ret void, !dbg !292
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @task_FL_Wheel(i8* %0) #0 !dbg !293 {
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
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !297, metadata !DIExpression()), !dbg !298
  %17 = load i32, i32* @test, align 4, !dbg !299
  %18 = add nsw i32 %17, 1, !dbg !299
  store i32 %18, i32* @test, align 4, !dbg !299
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !300
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !301
  %20 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !302
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !303
  %21 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !304
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !305
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !306
  store i32 %22, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !307
  %23 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !308
  store i32 %23, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata i32* %4, metadata !310, metadata !DIExpression()), !dbg !311
  store i32 10, i32* %4, align 4, !dbg !312
  %24 = load i32, i32* @RT_Buffer0, align 4, !dbg !313
  store i32 %24, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !314
  %25 = load i32, i32* @RT4_Buffer0, align 4, !dbg !315
  store i32 %25, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !316
  call void @llvm.dbg.declare(metadata i8* %5, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata i32* %6, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata i32* %7, metadata !321, metadata !DIExpression()), !dbg !322
  %26 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !323
  %27 = add nsw i32 10, %26, !dbg !324
  store i32 %27, i32* %6, align 4, !dbg !325
  %28 = load i32, i32* %6, align 4, !dbg !326
  %29 = add nsw i32 %28, 10, !dbg !327
  store i32 %29, i32* %7, align 4, !dbg !328
  %30 = load i32, i32* %7, align 4, !dbg !329
  %31 = load i32, i32* %4, align 4, !dbg !330
  %32 = add nsw i32 %30, %31, !dbg !331
  store i32 %32, i32* %7, align 4, !dbg !332
  call void @llvm.dbg.declare(metadata i32* %8, metadata !333, metadata !DIExpression()), !dbg !334
  store i32 100, i32* %8, align 4, !dbg !334
  %33 = load i32, i32* %7, align 4, !dbg !335
  %34 = load i32, i32* %8, align 4, !dbg !337
  %35 = icmp sge i32 %33, %34, !dbg !338
  br i1 %35, label %36, label %37, !dbg !339

36:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !340
  br label %43, !dbg !342

37:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata i32* %9, metadata !343, metadata !DIExpression()), !dbg !345
  store i32 5, i32* %9, align 4, !dbg !345
  %38 = load i32, i32* %7, align 4, !dbg !346
  %39 = load i32, i32* %9, align 4, !dbg !348
  %40 = icmp sle i32 %38, %39, !dbg !349
  br i1 %40, label %41, label %42, !dbg !350

41:                                               ; preds = %37
  store i32 5, i32* %7, align 4, !dbg !351
  br label %42, !dbg !353

42:                                               ; preds = %41, %37
  br label %43

43:                                               ; preds = %42, %36
  call void @llvm.dbg.declare(metadata i32* %10, metadata !354, metadata !DIExpression()), !dbg !355
  store i32 10, i32* %10, align 4, !dbg !355
  call void @llvm.dbg.declare(metadata i32* %11, metadata !356, metadata !DIExpression()), !dbg !357
  %44 = load i32, i32* %6, align 4, !dbg !358
  %45 = add nsw i32 10, %44, !dbg !359
  store i32 %45, i32* %11, align 4, !dbg !357
  %46 = load i32, i32* %10, align 4, !dbg !360
  %47 = load i32, i32* %11, align 4, !dbg !362
  %48 = icmp sgt i32 %46, %47, !dbg !363
  br i1 %48, label %49, label %50, !dbg !364

49:                                               ; preds = %43
  store i8 1, i8* %5, align 1, !dbg !365
  br label %51, !dbg !367

50:                                               ; preds = %43
  store i8 0, i8* %5, align 1, !dbg !368
  br label %51

51:                                               ; preds = %50, %49
  call void @llvm.dbg.declare(metadata i32* %12, metadata !370, metadata !DIExpression()), !dbg !371
  store i32 100, i32* %12, align 4, !dbg !371
  %52 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !372
  %53 = load i32, i32* %12, align 4, !dbg !374
  %54 = icmp sge i32 %52, %53, !dbg !375
  br i1 %54, label %55, label %62, !dbg !376

55:                                               ; preds = %51
  %56 = load i8, i8* %5, align 1, !dbg !377
  %57 = trunc i8 %56 to i1, !dbg !377
  br i1 %57, label %58, label %59, !dbg !380

58:                                               ; preds = %55
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !381
  br label %61, !dbg !383

59:                                               ; preds = %55
  %60 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !384
  store i32 %60, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !386
  br label %61

61:                                               ; preds = %59, %58
  br label %64, !dbg !387

62:                                               ; preds = %51
  %63 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !388
  store i32 %63, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh, align 4, !dbg !390
  br label %64

64:                                               ; preds = %62, %61
  call void @llvm.dbg.declare(metadata i32* %13, metadata !391, metadata !DIExpression()), !dbg !392
  %65 = load i8, i8* %5, align 1, !dbg !393
  %66 = trunc i8 %65 to i1, !dbg !393
  br i1 %66, label %67, label %68, !dbg !395

67:                                               ; preds = %64
  store i32 15, i32* %13, align 4, !dbg !396
  br label %69, !dbg !398

68:                                               ; preds = %64
  store i32 65, i32* %13, align 4, !dbg !399
  br label %69

69:                                               ; preds = %68, %67
  call void @llvm.dbg.declare(metadata i32* %14, metadata !401, metadata !DIExpression()), !dbg !402
  store i32 50, i32* %14, align 4, !dbg !402
  call void @llvm.dbg.declare(metadata i32* %15, metadata !403, metadata !DIExpression()), !dbg !404
  store i32 20, i32* %15, align 4, !dbg !404
  call void @llvm.dbg.declare(metadata i32* %16, metadata !405, metadata !DIExpression()), !dbg !406
  %70 = load i32, i32* %13, align 4, !dbg !407
  %71 = load i32, i32* %14, align 4, !dbg !409
  %72 = icmp sge i32 %70, %71, !dbg !410
  br i1 %72, label %73, label %74, !dbg !411

73:                                               ; preds = %69
  store i32 50, i32* %16, align 4, !dbg !412
  br label %74, !dbg !414

74:                                               ; preds = %73, %69
  %75 = load i32, i32* %13, align 4, !dbg !415
  %76 = load i32, i32* %15, align 4, !dbg !417
  %77 = icmp sle i32 %75, %76, !dbg !418
  br i1 %77, label %78, label %79, !dbg !419

78:                                               ; preds = %74
  store i32 20, i32* %16, align 4, !dbg !420
  br label %80, !dbg !422

79:                                               ; preds = %74
  store i32 15, i32* %16, align 4, !dbg !423
  br label %80

80:                                               ; preds = %79, %78
  %81 = load i32, i32* @brake_acc_nodiv_ctrl_P_Gain1_Gain, align 4, !dbg !425
  %82 = load i32, i32* %16, align 4, !dbg !426
  %83 = add nsw i32 %81, %82, !dbg !427
  store i32 %83, i32* @RT14, align 4, !dbg !428
  %84 = load i32, i32* %4, align 4, !dbg !429
  store i32 %84, i32* @RT12, align 4, !dbg !430
  %85 = load i8*, i8** %2, align 8, !dbg !431
  ret i8* %85, !dbg !431
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @task_FR_Wheel(i8* %0) #0 !dbg !432 {
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
  call void @llvm.dbg.declare(metadata i8** %3, metadata !433, metadata !DIExpression()), !dbg !434
  %13 = load i32, i32* @test, align 4, !dbg !435
  %14 = add nsw i32 %13, 1, !dbg !435
  store i32 %14, i32* @test, align 4, !dbg !435
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !436
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !437
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !438
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !439
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !440
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !441
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !442
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !443
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !444
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !445
  call void @llvm.dbg.declare(metadata i32* %4, metadata !446, metadata !DIExpression()), !dbg !447
  %20 = load i32, i32* @RT4_Buffer0, align 4, !dbg !448
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !449
  store i32 10, i32* %4, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata i8* %5, metadata !451, metadata !DIExpression()), !dbg !452
  call void @llvm.dbg.declare(metadata i32* %6, metadata !453, metadata !DIExpression()), !dbg !454
  %21 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !455
  %22 = add nsw i32 10, %21, !dbg !456
  store i32 %22, i32* %6, align 4, !dbg !454
  call void @llvm.dbg.declare(metadata i32* %7, metadata !457, metadata !DIExpression()), !dbg !458
  %23 = load i32, i32* %6, align 4, !dbg !459
  %24 = add nsw i32 %23, 10, !dbg !460
  store i32 %24, i32* %7, align 4, !dbg !458
  %25 = load i32, i32* %7, align 4, !dbg !461
  %26 = load i32, i32* %4, align 4, !dbg !462
  %27 = add nsw i32 %25, %26, !dbg !463
  store i32 %27, i32* %7, align 4, !dbg !464
  call void @llvm.dbg.declare(metadata i32* %8, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 100, i32* %8, align 4, !dbg !466
  %28 = load i32, i32* %7, align 4, !dbg !467
  %29 = load i32, i32* %8, align 4, !dbg !469
  %30 = icmp sge i32 %28, %29, !dbg !470
  br i1 %30, label %31, label %32, !dbg !471

31:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !472
  br label %38, !dbg !474

32:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata i32* %9, metadata !475, metadata !DIExpression()), !dbg !477
  store i32 5, i32* %9, align 4, !dbg !477
  %33 = load i32, i32* %7, align 4, !dbg !478
  %34 = load i32, i32* %9, align 4, !dbg !480
  %35 = icmp sle i32 %33, %34, !dbg !481
  br i1 %35, label %36, label %37, !dbg !482

36:                                               ; preds = %32
  store i32 5, i32* %7, align 4, !dbg !483
  br label %37, !dbg !485

37:                                               ; preds = %36, %32
  br label %38

38:                                               ; preds = %37, %31
  call void @llvm.dbg.declare(metadata i32* %10, metadata !486, metadata !DIExpression()), !dbg !487
  store i32 10, i32* %10, align 4, !dbg !487
  call void @llvm.dbg.declare(metadata i32* %11, metadata !488, metadata !DIExpression()), !dbg !489
  %39 = load i32, i32* %6, align 4, !dbg !490
  %40 = add nsw i32 10, %39, !dbg !491
  store i32 %40, i32* %11, align 4, !dbg !489
  %41 = load i32, i32* %10, align 4, !dbg !492
  %42 = load i32, i32* %11, align 4, !dbg !494
  %43 = icmp sgt i32 %41, %42, !dbg !495
  br i1 %43, label %44, label %45, !dbg !496

44:                                               ; preds = %38
  store i8 1, i8* %5, align 1, !dbg !497
  br label %46, !dbg !499

45:                                               ; preds = %38
  store i8 0, i8* %5, align 1, !dbg !500
  br label %46

46:                                               ; preds = %45, %44
  call void @llvm.dbg.declare(metadata i32* %12, metadata !502, metadata !DIExpression()), !dbg !503
  store i32 100, i32* %12, align 4, !dbg !503
  %47 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !504
  %48 = load i32, i32* %12, align 4, !dbg !506
  %49 = icmp sge i32 %47, %48, !dbg !507
  br i1 %49, label %50, label %57, !dbg !508

50:                                               ; preds = %46
  %51 = load i8, i8* %5, align 1, !dbg !509
  %52 = trunc i8 %51 to i1, !dbg !509
  br i1 %52, label %53, label %54, !dbg !512

53:                                               ; preds = %50
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !513
  br label %56, !dbg !515

54:                                               ; preds = %50
  %55 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !516
  store i32 %55, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !518
  br label %56

56:                                               ; preds = %54, %53
  br label %59, !dbg !519

57:                                               ; preds = %46
  %58 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !520
  store i32 %58, i32* @brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh, align 4, !dbg !522
  br label %59

59:                                               ; preds = %57, %56
  %60 = load i32, i32* @RT3_Buffer0, align 4, !dbg !523
  store i32 %60, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !524
  %61 = load i32, i32* %4, align 4, !dbg !525
  store i32 %61, i32* @RT11, align 4, !dbg !526
  %62 = load i8*, i8** %2, align 8, !dbg !527
  ret i8* %62, !dbg !527
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @task_RL_Wheel(i8* %0) #0 !dbg !528 {
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
  call void @llvm.dbg.declare(metadata i8** %3, metadata !529, metadata !DIExpression()), !dbg !530
  %13 = load i32, i32* @test, align 4, !dbg !531
  %14 = add nsw i32 %13, 1, !dbg !531
  store i32 %14, i32* @test, align 4, !dbg !531
  %15 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT_X0, align 4, !dbg !532
  store i32 %15, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !533
  %16 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT4_X0, align 4, !dbg !534
  store i32 %16, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !535
  %17 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT1_X0, align 4, !dbg !536
  store i32 %17, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !537
  %18 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT2_X0, align 4, !dbg !538
  store i32 %18, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !539
  %19 = load i32, i32* @brake_acc_nodiv_ctrl_P_RT3_X0, align 4, !dbg !540
  store i32 %19, i32* @brake_acc_nodiv_ctrl_B_local_RT3, align 4, !dbg !541
  call void @llvm.dbg.declare(metadata i32* %4, metadata !542, metadata !DIExpression()), !dbg !543
  %20 = load i32, i32* @RT_Buffer0, align 4, !dbg !544
  store i32 %20, i32* @brake_acc_nodiv_ctrl_B_local_RT_h, align 4, !dbg !545
  %21 = load i32, i32* @RT4_Buffer0, align 4, !dbg !546
  store i32 %21, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !547
  store i32 10, i32* %4, align 4, !dbg !548
  call void @llvm.dbg.declare(metadata i8* %5, metadata !549, metadata !DIExpression()), !dbg !550
  call void @llvm.dbg.declare(metadata i32* %6, metadata !551, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata i32* %7, metadata !553, metadata !DIExpression()), !dbg !554
  %22 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !555
  %23 = add nsw i32 10, %22, !dbg !556
  store i32 %23, i32* %6, align 4, !dbg !557
  %24 = load i32, i32* %6, align 4, !dbg !558
  %25 = add nsw i32 %24, 10, !dbg !559
  store i32 %25, i32* %7, align 4, !dbg !560
  %26 = load i32, i32* %7, align 4, !dbg !561
  %27 = load i32, i32* %4, align 4, !dbg !562
  %28 = add nsw i32 %26, %27, !dbg !563
  store i32 %28, i32* %7, align 4, !dbg !564
  call void @llvm.dbg.declare(metadata i32* %8, metadata !565, metadata !DIExpression()), !dbg !566
  store i32 100, i32* %8, align 4, !dbg !566
  %29 = load i32, i32* %7, align 4, !dbg !567
  %30 = load i32, i32* %8, align 4, !dbg !569
  %31 = icmp sge i32 %29, %30, !dbg !570
  br i1 %31, label %32, label %33, !dbg !571

32:                                               ; preds = %1
  store i32 100, i32* %7, align 4, !dbg !572
  br label %39, !dbg !574

33:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata i32* %9, metadata !575, metadata !DIExpression()), !dbg !577
  store i32 5, i32* %9, align 4, !dbg !577
  %34 = load i32, i32* %7, align 4, !dbg !578
  %35 = load i32, i32* %9, align 4, !dbg !580
  %36 = icmp sle i32 %34, %35, !dbg !581
  br i1 %36, label %37, label %38, !dbg !582

37:                                               ; preds = %33
  store i32 5, i32* %7, align 4, !dbg !583
  br label %38, !dbg !585

38:                                               ; preds = %37, %33
  br label %39

39:                                               ; preds = %38, %32
  call void @llvm.dbg.declare(metadata i32* %10, metadata !586, metadata !DIExpression()), !dbg !587
  store i32 10, i32* %10, align 4, !dbg !587
  call void @llvm.dbg.declare(metadata i32* %11, metadata !588, metadata !DIExpression()), !dbg !589
  %40 = load i32, i32* %6, align 4, !dbg !590
  %41 = add nsw i32 10, %40, !dbg !591
  store i32 %41, i32* %11, align 4, !dbg !589
  %42 = load i32, i32* %10, align 4, !dbg !592
  %43 = load i32, i32* %11, align 4, !dbg !594
  %44 = icmp sgt i32 %42, %43, !dbg !595
  br i1 %44, label %45, label %46, !dbg !596

45:                                               ; preds = %39
  store i8 1, i8* %5, align 1, !dbg !597
  br label %47, !dbg !599

46:                                               ; preds = %39
  store i8 0, i8* %5, align 1, !dbg !600
  br label %47

47:                                               ; preds = %46, %45
  call void @llvm.dbg.declare(metadata i32* %12, metadata !602, metadata !DIExpression()), !dbg !603
  store i32 100, i32* %12, align 4, !dbg !603
  %48 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT4, align 4, !dbg !604
  %49 = load i32, i32* %12, align 4, !dbg !606
  %50 = icmp sge i32 %48, %49, !dbg !607
  br i1 %50, label %51, label %58, !dbg !608

51:                                               ; preds = %47
  %52 = load i8, i8* %5, align 1, !dbg !609
  %53 = trunc i8 %52 to i1, !dbg !609
  br i1 %53, label %54, label %55, !dbg !612

54:                                               ; preds = %51
  store i32 8, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !613
  br label %57, !dbg !615

55:                                               ; preds = %51
  %56 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !616
  store i32 %56, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !618
  br label %57

57:                                               ; preds = %55, %54
  br label %60, !dbg !619

58:                                               ; preds = %47
  %59 = load i32, i32* @brake_acc_nodiv_ctrl_B_local_RT1, align 4, !dbg !620
  store i32 %59, i32* @brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh, align 4, !dbg !622
  br label %60

60:                                               ; preds = %58, %57
  %61 = load i32, i32* @RT2_Buffer0, align 4, !dbg !623
  store i32 %61, i32* @brake_acc_nodiv_ctrl_B_local_RT2, align 4, !dbg !624
  %62 = load i32, i32* %4, align 4, !dbg !625
  store i32 %62, i32* @RT10, align 4, !dbg !626
  %63 = load i8*, i8** %2, align 8, !dbg !627
  ret i8* %63, !dbg !627
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_004_001_main() #0 !dbg !628 {
  store i32 0, i32* @test, align 4, !dbg !631
  ret i32 0, !dbg !632
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!92, !93, !94, !95, !96}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!97}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_FL_Wheel_Threshold_10kmh", scope: !2, file: !8, line: 51, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "brake/brake1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!4 = !{}
!5 = !{!0, !6, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !78, !80, !82, !84, !86, !88, !90}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_RL_Wheel_Threshold_10kmh", scope: !2, file: !8, line: 52, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./brake/brake1.c", directory: "/Users/hehang03/code/clover/tool/Highlight/RWIP")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_RR_Wheel_Threshold_10kmh", scope: !2, file: !8, line: 53, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_ABS_FR_Wheel_Threshold_10kmh", scope: !2, file: !8, line: 54, type: !9, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT_h", scope: !2, file: !8, line: 43, type: !9, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RTH", scope: !2, file: !8, line: 44, type: !9, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT4", scope: !2, file: !8, line: 45, type: !9, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT1", scope: !2, file: !8, line: 46, type: !9, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT2", scope: !2, file: !8, line: 47, type: !9, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT3", scope: !2, file: !8, line: 48, type: !9, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_B_local_RT14", scope: !2, file: !8, line: 49, type: !9, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT_X0", scope: !2, file: !8, line: 56, type: !9, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT4_X0", scope: !2, file: !8, line: 57, type: !9, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT1_X0", scope: !2, file: !8, line: 58, type: !9, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT2_X0", scope: !2, file: !8, line: 59, type: !9, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_RT3_X0", scope: !2, file: !8, line: 60, type: !9, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Gain1_Gain", scope: !2, file: !8, line: 62, type: !9, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain0", scope: !2, file: !8, line: 64, type: !9, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain1", scope: !2, file: !8, line: 65, type: !9, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain2", scope: !2, file: !8, line: 66, type: !9, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_Distribution_Gain3", scope: !2, file: !8, line: 67, type: !9, isLocal: false, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_average_rpm_Gain", scope: !2, file: !8, line: 70, type: !9, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_wgrads_Gain", scope: !2, file: !8, line: 71, type: !9, isLocal: false, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "brake_acc_nodiv_ctrl_P_vkmh_Gain", scope: !2, file: !8, line: 72, type: !9, isLocal: false, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "vkmh", scope: !2, file: !8, line: 119, type: !9, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "test", scope: !2, file: !8, line: 120, type: !9, isLocal: false, isDefinition: true)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "RT9", scope: !2, file: !8, line: 122, type: !9, isLocal: false, isDefinition: true)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "RT10", scope: !2, file: !8, line: 123, type: !9, isLocal: false, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "RT11", scope: !2, file: !8, line: 124, type: !9, isLocal: false, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "RT12", scope: !2, file: !8, line: 125, type: !9, isLocal: false, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "RT14", scope: !2, file: !8, line: 126, type: !9, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "RT_Buffer0", scope: !2, file: !8, line: 128, type: !9, isLocal: false, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "RT0_Buffer0", scope: !2, file: !8, line: 129, type: !9, isLocal: false, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "RT1_Buffer0", scope: !2, file: !8, line: 130, type: !9, isLocal: false, isDefinition: true)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(name: "RT2_Buffer0", scope: !2, file: !8, line: 131, type: !9, isLocal: false, isDefinition: true)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "RT3_Buffer0", scope: !2, file: !8, line: 132, type: !9, isLocal: false, isDefinition: true)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(name: "RT4_Buffer0", scope: !2, file: !8, line: 133, type: !9, isLocal: false, isDefinition: true)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(name: "Distribution_idx", scope: !2, file: !8, line: 135, type: !9, isLocal: false, isDefinition: true)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "Distribution_idx_0", scope: !2, file: !8, line: 136, type: !9, isLocal: false, isDefinition: true)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "Distribution_idx_1", scope: !2, file: !8, line: 137, type: !9, isLocal: false, isDefinition: true)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "cnt1", scope: !2, file: !8, line: 140, type: !9, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "cnt2", scope: !2, file: !8, line: 140, type: !9, isLocal: false, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "cnt3", scope: !2, file: !8, line: 140, type: !9, isLocal: false, isDefinition: true)
!92 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!93 = !{i32 7, !"Dwarf Version", i32 4}
!94 = !{i32 2, !"Debug Info Version", i32 3}
!95 = !{i32 1, !"wchar_size", i32 4}
!96 = !{i32 7, !"PIC Level", i32 2}
!97 = !{!"clang version 10.0.0 "}
!98 = distinct !DISubprogram(name: "task_isr_1", scope: !8, file: !8, line: 142, type: !99, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DISubroutineType(types: !100)
!100 = !{null}
!101 = !DILocation(line: 145, column: 13, scope: !98)
!102 = !DILocation(line: 149, column: 45, scope: !98)
!103 = !DILocation(line: 149, column: 43, scope: !98)
!104 = !DILocation(line: 152, column: 44, scope: !98)
!105 = !DILocation(line: 152, column: 42, scope: !98)
!106 = !DILocation(line: 155, column: 44, scope: !98)
!107 = !DILocation(line: 155, column: 42, scope: !98)
!108 = !DILocation(line: 158, column: 44, scope: !98)
!109 = !DILocation(line: 158, column: 42, scope: !98)
!110 = !DILocation(line: 161, column: 44, scope: !98)
!111 = !DILocation(line: 161, column: 42, scope: !98)
!112 = !DILocation(line: 164, column: 14, scope: !98)
!113 = !DILocation(line: 172, column: 28, scope: !98)
!114 = !DILocation(line: 173, column: 13, scope: !98)
!115 = !DILocation(line: 172, column: 70, scope: !98)
!116 = !DILocation(line: 172, column: 26, scope: !98)
!117 = !DILocation(line: 174, column: 30, scope: !98)
!118 = !DILocation(line: 175, column: 13, scope: !98)
!119 = !DILocation(line: 174, column: 72, scope: !98)
!120 = !DILocation(line: 174, column: 28, scope: !98)
!121 = !DILocation(line: 176, column: 30, scope: !98)
!122 = !DILocation(line: 177, column: 13, scope: !98)
!123 = !DILocation(line: 176, column: 72, scope: !98)
!124 = !DILocation(line: 176, column: 28, scope: !98)
!125 = !DILocation(line: 191, column: 16, scope: !98)
!126 = !DILocation(line: 191, column: 20, scope: !98)
!127 = !DILocation(line: 191, column: 19, scope: !98)
!128 = !DILocation(line: 191, column: 14, scope: !98)
!129 = !DILocation(line: 192, column: 16, scope: !98)
!130 = !DILocation(line: 192, column: 23, scope: !98)
!131 = !DILocation(line: 192, column: 21, scope: !98)
!132 = !DILocation(line: 192, column: 14, scope: !98)
!133 = !DILocation(line: 193, column: 16, scope: !98)
!134 = !DILocation(line: 193, column: 23, scope: !98)
!135 = !DILocation(line: 193, column: 21, scope: !98)
!136 = !DILocation(line: 193, column: 14, scope: !98)
!137 = !DILocation(line: 194, column: 16, scope: !98)
!138 = !DILocation(line: 194, column: 23, scope: !98)
!139 = !DILocation(line: 194, column: 21, scope: !98)
!140 = !DILocation(line: 194, column: 14, scope: !98)
!141 = !DILocation(line: 195, column: 16, scope: !98)
!142 = !DILocation(line: 195, column: 23, scope: !98)
!143 = !DILocation(line: 195, column: 21, scope: !98)
!144 = !DILocation(line: 195, column: 14, scope: !98)
!145 = !DILocation(line: 196, column: 16, scope: !98)
!146 = !DILocation(line: 196, column: 23, scope: !98)
!147 = !DILocation(line: 196, column: 21, scope: !98)
!148 = !DILocation(line: 196, column: 14, scope: !98)
!149 = !DILocation(line: 199, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !98, file: !8, line: 199, column: 13)
!151 = !DILocation(line: 199, column: 18, scope: !150)
!152 = !DILocation(line: 199, column: 13, scope: !98)
!153 = !DILocation(line: 201, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !8, line: 199, column: 24)
!155 = !DILocation(line: 203, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !98, file: !8, line: 203, column: 13)
!157 = !DILocation(line: 203, column: 18, scope: !156)
!158 = !DILocation(line: 203, column: 13, scope: !98)
!159 = !DILocation(line: 205, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !8, line: 203, column: 24)
!161 = !DILocation(line: 207, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !98, file: !8, line: 207, column: 13)
!163 = !DILocation(line: 207, column: 18, scope: !162)
!164 = !DILocation(line: 207, column: 13, scope: !98)
!165 = !DILocation(line: 209, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !8, line: 207, column: 24)
!167 = !DILocation(line: 211, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !98, file: !8, line: 211, column: 13)
!169 = !DILocation(line: 211, column: 18, scope: !168)
!170 = !DILocation(line: 211, column: 13, scope: !98)
!171 = !DILocation(line: 213, column: 9, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !8, line: 211, column: 24)
!173 = !DILocation(line: 215, column: 13, scope: !174)
!174 = distinct !DILexicalBlock(scope: !98, file: !8, line: 215, column: 13)
!175 = !DILocation(line: 215, column: 18, scope: !174)
!176 = !DILocation(line: 215, column: 13, scope: !98)
!177 = !DILocation(line: 217, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !8, line: 215, column: 24)
!179 = !DILocation(line: 219, column: 13, scope: !98)
!180 = !DILocation(line: 233, column: 22, scope: !98)
!181 = !DILocation(line: 233, column: 66, scope: !98)
!182 = !DILocation(line: 233, column: 64, scope: !98)
!183 = !DILocation(line: 233, column: 20, scope: !98)
!184 = !DILocation(line: 236, column: 23, scope: !98)
!185 = !DILocation(line: 236, column: 21, scope: !98)
!186 = !DILocation(line: 239, column: 23, scope: !98)
!187 = !DILocation(line: 239, column: 21, scope: !98)
!188 = !DILocation(line: 242, column: 23, scope: !98)
!189 = !DILocation(line: 242, column: 21, scope: !98)
!190 = !DILocation(line: 245, column: 23, scope: !98)
!191 = !DILocation(line: 245, column: 21, scope: !98)
!192 = !DILocation(line: 249, column: 1, scope: !98)
!193 = distinct !DISubprogram(name: "task_isr_2", scope: !8, file: !8, line: 251, type: !99, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DILocation(line: 256, column: 13, scope: !193)
!195 = !DILocation(line: 257, column: 14, scope: !193)
!196 = !DILocation(line: 259, column: 45, scope: !193)
!197 = !DILocation(line: 259, column: 43, scope: !193)
!198 = !DILocation(line: 261, column: 44, scope: !193)
!199 = !DILocation(line: 261, column: 42, scope: !193)
!200 = !DILocation(line: 263, column: 44, scope: !193)
!201 = !DILocation(line: 263, column: 42, scope: !193)
!202 = !DILocation(line: 265, column: 44, scope: !193)
!203 = !DILocation(line: 265, column: 42, scope: !193)
!204 = !DILocation(line: 267, column: 44, scope: !193)
!205 = !DILocation(line: 267, column: 42, scope: !193)
!206 = !DILocalVariable(name: "rtb_to_int", scope: !193, file: !8, line: 273, type: !9)
!207 = !DILocation(line: 273, column: 13, scope: !193)
!208 = !DILocation(line: 275, column: 45, scope: !193)
!209 = !DILocation(line: 275, column: 43, scope: !193)
!210 = !DILocation(line: 277, column: 44, scope: !193)
!211 = !DILocation(line: 277, column: 42, scope: !193)
!212 = !DILocation(line: 279, column: 20, scope: !193)
!213 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !193, file: !8, line: 281, type: !214)
!214 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!215 = !DILocation(line: 281, column: 14, scope: !193)
!216 = !DILocalVariable(name: "rtb_vms", scope: !193, file: !8, line: 282, type: !9)
!217 = !DILocation(line: 282, column: 13, scope: !193)
!218 = !DILocalVariable(name: "u", scope: !193, file: !8, line: 283, type: !9)
!219 = !DILocation(line: 283, column: 13, scope: !193)
!220 = !DILocation(line: 284, column: 66, scope: !193)
!221 = !DILocation(line: 284, column: 64, scope: !193)
!222 = !DILocation(line: 284, column: 17, scope: !193)
!223 = !DILocation(line: 286, column: 13, scope: !193)
!224 = !DILocation(line: 286, column: 21, scope: !193)
!225 = !DILocation(line: 286, column: 11, scope: !193)
!226 = !DILocation(line: 287, column: 13, scope: !193)
!227 = !DILocation(line: 287, column: 17, scope: !193)
!228 = !DILocation(line: 287, column: 15, scope: !193)
!229 = !DILocation(line: 287, column: 11, scope: !193)
!230 = !DILocalVariable(name: "positive_UpperSat_local", scope: !193, file: !8, line: 289, type: !9)
!231 = !DILocation(line: 289, column: 13, scope: !193)
!232 = !DILocation(line: 291, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !193, file: !8, line: 291, column: 13)
!234 = !DILocation(line: 291, column: 18, scope: !233)
!235 = !DILocation(line: 291, column: 15, scope: !233)
!236 = !DILocation(line: 291, column: 13, scope: !193)
!237 = !DILocation(line: 292, column: 15, scope: !238)
!238 = distinct !DILexicalBlock(scope: !233, file: !8, line: 291, column: 43)
!239 = !DILocation(line: 293, column: 9, scope: !238)
!240 = !DILocalVariable(name: "positive_LowerSat_local", scope: !241, file: !8, line: 294, type: !9)
!241 = distinct !DILexicalBlock(scope: !233, file: !8, line: 293, column: 16)
!242 = !DILocation(line: 294, column: 17, scope: !241)
!243 = !DILocation(line: 295, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !8, line: 295, column: 17)
!245 = !DILocation(line: 295, column: 22, scope: !244)
!246 = !DILocation(line: 295, column: 19, scope: !244)
!247 = !DILocation(line: 295, column: 17, scope: !241)
!248 = !DILocation(line: 296, column: 19, scope: !249)
!249 = distinct !DILexicalBlock(scope: !244, file: !8, line: 295, column: 47)
!250 = !DILocation(line: 297, column: 13, scope: !249)
!251 = !DILocalVariable(name: "tmp0", scope: !193, file: !8, line: 306, type: !9)
!252 = !DILocation(line: 306, column: 13, scope: !193)
!253 = !DILocalVariable(name: "tmp1", scope: !193, file: !8, line: 308, type: !9)
!254 = !DILocation(line: 308, column: 13, scope: !193)
!255 = !DILocation(line: 308, column: 84, scope: !193)
!256 = !DILocation(line: 308, column: 82, scope: !193)
!257 = !DILocation(line: 309, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !193, file: !8, line: 309, column: 13)
!259 = !DILocation(line: 309, column: 20, scope: !258)
!260 = !DILocation(line: 309, column: 18, scope: !258)
!261 = !DILocation(line: 309, column: 13, scope: !193)
!262 = !DILocation(line: 310, column: 36, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !8, line: 309, column: 26)
!264 = !DILocation(line: 311, column: 9, scope: !263)
!265 = !DILocation(line: 312, column: 36, scope: !266)
!266 = distinct !DILexicalBlock(scope: !258, file: !8, line: 311, column: 16)
!267 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !193, file: !8, line: 316, type: !9)
!268 = !DILocation(line: 316, column: 13, scope: !193)
!269 = !DILocation(line: 317, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !193, file: !8, line: 317, column: 13)
!271 = !DILocation(line: 317, column: 49, scope: !270)
!272 = !DILocation(line: 317, column: 46, scope: !270)
!273 = !DILocation(line: 317, column: 13, scope: !193)
!274 = !DILocation(line: 323, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !8, line: 323, column: 17)
!276 = distinct !DILexicalBlock(scope: !270, file: !8, line: 317, column: 82)
!277 = !DILocation(line: 323, column: 17, scope: !276)
!278 = !DILocation(line: 324, column: 75, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !8, line: 323, column: 41)
!280 = !DILocation(line: 325, column: 13, scope: !279)
!281 = !DILocation(line: 326, column: 77, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !8, line: 325, column: 20)
!283 = !DILocation(line: 326, column: 75, scope: !282)
!284 = !DILocation(line: 329, column: 9, scope: !276)
!285 = !DILocation(line: 332, column: 73, scope: !286)
!286 = distinct !DILexicalBlock(scope: !270, file: !8, line: 329, column: 16)
!287 = !DILocation(line: 332, column: 71, scope: !286)
!288 = !DILocation(line: 341, column: 44, scope: !193)
!289 = !DILocation(line: 341, column: 42, scope: !193)
!290 = !DILocation(line: 349, column: 15, scope: !193)
!291 = !DILocation(line: 349, column: 13, scope: !193)
!292 = !DILocation(line: 351, column: 5, scope: !193)
!293 = distinct !DISubprogram(name: "task_FL_Wheel", scope: !8, file: !8, line: 353, type: !294, scopeLine: 353, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!294 = !DISubroutineType(types: !295)
!295 = !{!296, !296}
!296 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!297 = !DILocalVariable(name: "unused", arg: 1, scope: !293, file: !8, line: 353, type: !296)
!298 = !DILocation(line: 353, column: 31, scope: !293)
!299 = !DILocation(line: 354, column: 14, scope: !293)
!300 = !DILocation(line: 357, column: 45, scope: !293)
!301 = !DILocation(line: 357, column: 43, scope: !293)
!302 = !DILocation(line: 359, column: 44, scope: !293)
!303 = !DILocation(line: 359, column: 42, scope: !293)
!304 = !DILocation(line: 361, column: 44, scope: !293)
!305 = !DILocation(line: 361, column: 42, scope: !293)
!306 = !DILocation(line: 363, column: 44, scope: !293)
!307 = !DILocation(line: 363, column: 42, scope: !293)
!308 = !DILocation(line: 365, column: 44, scope: !293)
!309 = !DILocation(line: 365, column: 42, scope: !293)
!310 = !DILocalVariable(name: "rtb_to_int1", scope: !293, file: !8, line: 366, type: !9)
!311 = !DILocation(line: 366, column: 13, scope: !293)
!312 = !DILocation(line: 371, column: 17, scope: !293)
!313 = !DILocation(line: 373, column: 45, scope: !293)
!314 = !DILocation(line: 373, column: 43, scope: !293)
!315 = !DILocation(line: 375, column: 40, scope: !293)
!316 = !DILocation(line: 375, column: 38, scope: !293)
!317 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !293, file: !8, line: 386, type: !214)
!318 = !DILocation(line: 386, column: 10, scope: !293)
!319 = !DILocalVariable(name: "rtb_vms", scope: !293, file: !8, line: 387, type: !9)
!320 = !DILocation(line: 387, column: 9, scope: !293)
!321 = !DILocalVariable(name: "u", scope: !293, file: !8, line: 388, type: !9)
!322 = !DILocation(line: 388, column: 9, scope: !293)
!323 = !DILocation(line: 391, column: 62, scope: !293)
!324 = !DILocation(line: 391, column: 60, scope: !293)
!325 = !DILocation(line: 391, column: 13, scope: !293)
!326 = !DILocation(line: 395, column: 9, scope: !293)
!327 = !DILocation(line: 395, column: 17, scope: !293)
!328 = !DILocation(line: 395, column: 7, scope: !293)
!329 = !DILocation(line: 396, column: 9, scope: !293)
!330 = !DILocation(line: 396, column: 13, scope: !293)
!331 = !DILocation(line: 396, column: 11, scope: !293)
!332 = !DILocation(line: 396, column: 7, scope: !293)
!333 = !DILocalVariable(name: "positive_UpperSat_local", scope: !293, file: !8, line: 399, type: !9)
!334 = !DILocation(line: 399, column: 9, scope: !293)
!335 = !DILocation(line: 401, column: 9, scope: !336)
!336 = distinct !DILexicalBlock(scope: !293, file: !8, line: 401, column: 9)
!337 = !DILocation(line: 401, column: 14, scope: !336)
!338 = !DILocation(line: 401, column: 11, scope: !336)
!339 = !DILocation(line: 401, column: 9, scope: !293)
!340 = !DILocation(line: 402, column: 11, scope: !341)
!341 = distinct !DILexicalBlock(scope: !336, file: !8, line: 401, column: 39)
!342 = !DILocation(line: 403, column: 5, scope: !341)
!343 = !DILocalVariable(name: "positive_LowerSat_local", scope: !344, file: !8, line: 405, type: !9)
!344 = distinct !DILexicalBlock(scope: !336, file: !8, line: 403, column: 12)
!345 = !DILocation(line: 405, column: 13, scope: !344)
!346 = !DILocation(line: 406, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !8, line: 406, column: 13)
!348 = !DILocation(line: 406, column: 18, scope: !347)
!349 = !DILocation(line: 406, column: 15, scope: !347)
!350 = !DILocation(line: 406, column: 13, scope: !344)
!351 = !DILocation(line: 407, column: 15, scope: !352)
!352 = distinct !DILexicalBlock(scope: !347, file: !8, line: 406, column: 43)
!353 = !DILocation(line: 408, column: 9, scope: !352)
!354 = !DILocalVariable(name: "tmp0", scope: !293, file: !8, line: 417, type: !9)
!355 = !DILocation(line: 417, column: 9, scope: !293)
!356 = !DILocalVariable(name: "tmp1", scope: !293, file: !8, line: 418, type: !9)
!357 = !DILocation(line: 418, column: 9, scope: !293)
!358 = !DILocation(line: 418, column: 80, scope: !293)
!359 = !DILocation(line: 418, column: 78, scope: !293)
!360 = !DILocation(line: 419, column: 9, scope: !361)
!361 = distinct !DILexicalBlock(scope: !293, file: !8, line: 419, column: 9)
!362 = !DILocation(line: 419, column: 16, scope: !361)
!363 = !DILocation(line: 419, column: 14, scope: !361)
!364 = !DILocation(line: 419, column: 9, scope: !293)
!365 = !DILocation(line: 420, column: 32, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !8, line: 419, column: 22)
!367 = !DILocation(line: 421, column: 5, scope: !366)
!368 = !DILocation(line: 422, column: 32, scope: !369)
!369 = distinct !DILexicalBlock(scope: !361, file: !8, line: 421, column: 12)
!370 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !293, file: !8, line: 426, type: !9)
!371 = !DILocation(line: 426, column: 9, scope: !293)
!372 = !DILocation(line: 427, column: 9, scope: !373)
!373 = distinct !DILexicalBlock(scope: !293, file: !8, line: 427, column: 9)
!374 = !DILocation(line: 427, column: 45, scope: !373)
!375 = !DILocation(line: 427, column: 42, scope: !373)
!376 = !DILocation(line: 427, column: 9, scope: !293)
!377 = !DILocation(line: 432, column: 13, scope: !378)
!378 = distinct !DILexicalBlock(scope: !379, file: !8, line: 432, column: 13)
!379 = distinct !DILexicalBlock(scope: !373, file: !8, line: 427, column: 78)
!380 = !DILocation(line: 432, column: 13, scope: !379)
!381 = !DILocation(line: 433, column: 71, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !8, line: 432, column: 37)
!383 = !DILocation(line: 434, column: 9, scope: !382)
!384 = !DILocation(line: 435, column: 73, scope: !385)
!385 = distinct !DILexicalBlock(scope: !378, file: !8, line: 434, column: 16)
!386 = !DILocation(line: 435, column: 71, scope: !385)
!387 = !DILocation(line: 438, column: 5, scope: !379)
!388 = !DILocation(line: 441, column: 69, scope: !389)
!389 = distinct !DILexicalBlock(scope: !373, file: !8, line: 438, column: 12)
!390 = !DILocation(line: 441, column: 67, scope: !389)
!391 = !DILocalVariable(name: "In_BrakePedal", scope: !293, file: !8, line: 453, type: !9)
!392 = !DILocation(line: 453, column: 9, scope: !293)
!393 = !DILocation(line: 454, column: 9, scope: !394)
!394 = distinct !DILexicalBlock(scope: !293, file: !8, line: 454, column: 9)
!395 = !DILocation(line: 454, column: 9, scope: !293)
!396 = !DILocation(line: 455, column: 23, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !8, line: 454, column: 33)
!398 = !DILocation(line: 456, column: 5, scope: !397)
!399 = !DILocation(line: 457, column: 23, scope: !400)
!400 = distinct !DILexicalBlock(scope: !394, file: !8, line: 456, column: 12)
!401 = !DILocalVariable(name: "Pedal_map_UpperSat", scope: !293, file: !8, line: 459, type: !9)
!402 = !DILocation(line: 459, column: 9, scope: !293)
!403 = !DILocalVariable(name: "Pedal_map_LowerSat", scope: !293, file: !8, line: 460, type: !9)
!404 = !DILocation(line: 460, column: 9, scope: !293)
!405 = !DILocalVariable(name: "tmp", scope: !293, file: !8, line: 461, type: !9)
!406 = !DILocation(line: 461, column: 9, scope: !293)
!407 = !DILocation(line: 462, column: 9, scope: !408)
!408 = distinct !DILexicalBlock(scope: !293, file: !8, line: 462, column: 9)
!409 = !DILocation(line: 462, column: 26, scope: !408)
!410 = !DILocation(line: 462, column: 23, scope: !408)
!411 = !DILocation(line: 462, column: 9, scope: !293)
!412 = !DILocation(line: 463, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !408, file: !8, line: 462, column: 46)
!414 = !DILocation(line: 464, column: 5, scope: !413)
!415 = !DILocation(line: 465, column: 9, scope: !416)
!416 = distinct !DILexicalBlock(scope: !293, file: !8, line: 465, column: 9)
!417 = !DILocation(line: 465, column: 26, scope: !416)
!418 = !DILocation(line: 465, column: 23, scope: !416)
!419 = !DILocation(line: 465, column: 9, scope: !293)
!420 = !DILocation(line: 466, column: 13, scope: !421)
!421 = distinct !DILexicalBlock(scope: !416, file: !8, line: 465, column: 46)
!422 = !DILocation(line: 467, column: 5, scope: !421)
!423 = !DILocation(line: 468, column: 13, scope: !424)
!424 = distinct !DILexicalBlock(scope: !416, file: !8, line: 467, column: 12)
!425 = !DILocation(line: 474, column: 12, scope: !293)
!426 = !DILocation(line: 474, column: 48, scope: !293)
!427 = !DILocation(line: 474, column: 46, scope: !293)
!428 = !DILocation(line: 474, column: 10, scope: !293)
!429 = !DILocation(line: 476, column: 12, scope: !293)
!430 = !DILocation(line: 476, column: 10, scope: !293)
!431 = !DILocation(line: 477, column: 1, scope: !293)
!432 = distinct !DISubprogram(name: "task_FR_Wheel", scope: !8, file: !8, line: 479, type: !294, scopeLine: 480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!433 = !DILocalVariable(name: "unused", arg: 1, scope: !432, file: !8, line: 479, type: !296)
!434 = !DILocation(line: 479, column: 27, scope: !432)
!435 = !DILocation(line: 481, column: 10, scope: !432)
!436 = !DILocation(line: 484, column: 41, scope: !432)
!437 = !DILocation(line: 484, column: 39, scope: !432)
!438 = !DILocation(line: 486, column: 40, scope: !432)
!439 = !DILocation(line: 486, column: 38, scope: !432)
!440 = !DILocation(line: 488, column: 40, scope: !432)
!441 = !DILocation(line: 488, column: 38, scope: !432)
!442 = !DILocation(line: 490, column: 40, scope: !432)
!443 = !DILocation(line: 490, column: 38, scope: !432)
!444 = !DILocation(line: 492, column: 40, scope: !432)
!445 = !DILocation(line: 492, column: 38, scope: !432)
!446 = !DILocalVariable(name: "rtb_to_int_k", scope: !432, file: !8, line: 496, type: !9)
!447 = !DILocation(line: 496, column: 9, scope: !432)
!448 = !DILocation(line: 498, column: 40, scope: !432)
!449 = !DILocation(line: 498, column: 38, scope: !432)
!450 = !DILocation(line: 503, column: 15, scope: !432)
!451 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !432, file: !8, line: 514, type: !214)
!452 = !DILocation(line: 514, column: 10, scope: !432)
!453 = !DILocalVariable(name: "rtb_vms", scope: !432, file: !8, line: 517, type: !9)
!454 = !DILocation(line: 517, column: 9, scope: !432)
!455 = !DILocation(line: 517, column: 66, scope: !432)
!456 = !DILocation(line: 517, column: 64, scope: !432)
!457 = !DILocalVariable(name: "u", scope: !432, file: !8, line: 521, type: !9)
!458 = !DILocation(line: 521, column: 9, scope: !432)
!459 = !DILocation(line: 521, column: 13, scope: !432)
!460 = !DILocation(line: 521, column: 21, scope: !432)
!461 = !DILocation(line: 522, column: 9, scope: !432)
!462 = !DILocation(line: 522, column: 13, scope: !432)
!463 = !DILocation(line: 522, column: 11, scope: !432)
!464 = !DILocation(line: 522, column: 7, scope: !432)
!465 = !DILocalVariable(name: "positive_UpperSat_local", scope: !432, file: !8, line: 525, type: !9)
!466 = !DILocation(line: 525, column: 9, scope: !432)
!467 = !DILocation(line: 526, column: 9, scope: !468)
!468 = distinct !DILexicalBlock(scope: !432, file: !8, line: 526, column: 9)
!469 = !DILocation(line: 526, column: 14, scope: !468)
!470 = !DILocation(line: 526, column: 11, scope: !468)
!471 = !DILocation(line: 526, column: 9, scope: !432)
!472 = !DILocation(line: 527, column: 11, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !8, line: 526, column: 39)
!474 = !DILocation(line: 528, column: 5, scope: !473)
!475 = !DILocalVariable(name: "positive_LowerSat_local", scope: !476, file: !8, line: 530, type: !9)
!476 = distinct !DILexicalBlock(scope: !468, file: !8, line: 528, column: 12)
!477 = !DILocation(line: 530, column: 13, scope: !476)
!478 = !DILocation(line: 531, column: 13, scope: !479)
!479 = distinct !DILexicalBlock(scope: !476, file: !8, line: 531, column: 13)
!480 = !DILocation(line: 531, column: 18, scope: !479)
!481 = !DILocation(line: 531, column: 15, scope: !479)
!482 = !DILocation(line: 531, column: 13, scope: !476)
!483 = !DILocation(line: 532, column: 15, scope: !484)
!484 = distinct !DILexicalBlock(scope: !479, file: !8, line: 531, column: 43)
!485 = !DILocation(line: 533, column: 9, scope: !484)
!486 = !DILocalVariable(name: "tmp0", scope: !432, file: !8, line: 543, type: !9)
!487 = !DILocation(line: 543, column: 9, scope: !432)
!488 = !DILocalVariable(name: "tmp1", scope: !432, file: !8, line: 544, type: !9)
!489 = !DILocation(line: 544, column: 9, scope: !432)
!490 = !DILocation(line: 544, column: 80, scope: !432)
!491 = !DILocation(line: 544, column: 78, scope: !432)
!492 = !DILocation(line: 545, column: 9, scope: !493)
!493 = distinct !DILexicalBlock(scope: !432, file: !8, line: 545, column: 9)
!494 = !DILocation(line: 545, column: 16, scope: !493)
!495 = !DILocation(line: 545, column: 14, scope: !493)
!496 = !DILocation(line: 545, column: 9, scope: !432)
!497 = !DILocation(line: 546, column: 32, scope: !498)
!498 = distinct !DILexicalBlock(scope: !493, file: !8, line: 545, column: 22)
!499 = !DILocation(line: 547, column: 5, scope: !498)
!500 = !DILocation(line: 548, column: 32, scope: !501)
!501 = distinct !DILexicalBlock(scope: !493, file: !8, line: 547, column: 12)
!502 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !432, file: !8, line: 552, type: !9)
!503 = !DILocation(line: 552, column: 9, scope: !432)
!504 = !DILocation(line: 553, column: 9, scope: !505)
!505 = distinct !DILexicalBlock(scope: !432, file: !8, line: 553, column: 9)
!506 = !DILocation(line: 553, column: 45, scope: !505)
!507 = !DILocation(line: 553, column: 42, scope: !505)
!508 = !DILocation(line: 553, column: 9, scope: !432)
!509 = !DILocation(line: 558, column: 13, scope: !510)
!510 = distinct !DILexicalBlock(scope: !511, file: !8, line: 558, column: 13)
!511 = distinct !DILexicalBlock(scope: !505, file: !8, line: 553, column: 78)
!512 = !DILocation(line: 558, column: 13, scope: !511)
!513 = !DILocation(line: 559, column: 71, scope: !514)
!514 = distinct !DILexicalBlock(scope: !510, file: !8, line: 558, column: 37)
!515 = !DILocation(line: 560, column: 9, scope: !514)
!516 = !DILocation(line: 561, column: 73, scope: !517)
!517 = distinct !DILexicalBlock(scope: !510, file: !8, line: 560, column: 16)
!518 = !DILocation(line: 561, column: 71, scope: !517)
!519 = !DILocation(line: 564, column: 5, scope: !511)
!520 = !DILocation(line: 567, column: 69, scope: !521)
!521 = distinct !DILexicalBlock(scope: !505, file: !8, line: 564, column: 12)
!522 = !DILocation(line: 567, column: 67, scope: !521)
!523 = !DILocation(line: 577, column: 40, scope: !432)
!524 = !DILocation(line: 577, column: 38, scope: !432)
!525 = !DILocation(line: 580, column: 12, scope: !432)
!526 = !DILocation(line: 580, column: 10, scope: !432)
!527 = !DILocation(line: 581, column: 1, scope: !432)
!528 = distinct !DISubprogram(name: "task_RL_Wheel", scope: !8, file: !8, line: 583, type: !294, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!529 = !DILocalVariable(name: "unused", arg: 1, scope: !528, file: !8, line: 583, type: !296)
!530 = !DILocation(line: 583, column: 27, scope: !528)
!531 = !DILocation(line: 585, column: 10, scope: !528)
!532 = !DILocation(line: 589, column: 41, scope: !528)
!533 = !DILocation(line: 589, column: 39, scope: !528)
!534 = !DILocation(line: 591, column: 40, scope: !528)
!535 = !DILocation(line: 591, column: 38, scope: !528)
!536 = !DILocation(line: 593, column: 40, scope: !528)
!537 = !DILocation(line: 593, column: 38, scope: !528)
!538 = !DILocation(line: 595, column: 40, scope: !528)
!539 = !DILocation(line: 595, column: 38, scope: !528)
!540 = !DILocation(line: 597, column: 40, scope: !528)
!541 = !DILocation(line: 597, column: 38, scope: !528)
!542 = !DILocalVariable(name: "rtb_to_int_g", scope: !528, file: !8, line: 601, type: !9)
!543 = !DILocation(line: 601, column: 9, scope: !528)
!544 = !DILocation(line: 603, column: 41, scope: !528)
!545 = !DILocation(line: 603, column: 39, scope: !528)
!546 = !DILocation(line: 605, column: 40, scope: !528)
!547 = !DILocation(line: 605, column: 38, scope: !528)
!548 = !DILocation(line: 607, column: 15, scope: !528)
!549 = !DILocalVariable(name: "rtb_RelationalOperator", scope: !528, file: !8, line: 609, type: !214)
!550 = !DILocation(line: 609, column: 10, scope: !528)
!551 = !DILocalVariable(name: "rtb_vms", scope: !528, file: !8, line: 610, type: !9)
!552 = !DILocation(line: 610, column: 9, scope: !528)
!553 = !DILocalVariable(name: "u", scope: !528, file: !8, line: 611, type: !9)
!554 = !DILocation(line: 611, column: 9, scope: !528)
!555 = !DILocation(line: 612, column: 62, scope: !528)
!556 = !DILocation(line: 612, column: 60, scope: !528)
!557 = !DILocation(line: 612, column: 13, scope: !528)
!558 = !DILocation(line: 614, column: 9, scope: !528)
!559 = !DILocation(line: 614, column: 17, scope: !528)
!560 = !DILocation(line: 614, column: 7, scope: !528)
!561 = !DILocation(line: 615, column: 9, scope: !528)
!562 = !DILocation(line: 615, column: 13, scope: !528)
!563 = !DILocation(line: 615, column: 11, scope: !528)
!564 = !DILocation(line: 615, column: 7, scope: !528)
!565 = !DILocalVariable(name: "positive_UpperSat_local", scope: !528, file: !8, line: 617, type: !9)
!566 = !DILocation(line: 617, column: 9, scope: !528)
!567 = !DILocation(line: 619, column: 9, scope: !568)
!568 = distinct !DILexicalBlock(scope: !528, file: !8, line: 619, column: 9)
!569 = !DILocation(line: 619, column: 14, scope: !568)
!570 = !DILocation(line: 619, column: 11, scope: !568)
!571 = !DILocation(line: 619, column: 9, scope: !528)
!572 = !DILocation(line: 620, column: 11, scope: !573)
!573 = distinct !DILexicalBlock(scope: !568, file: !8, line: 619, column: 39)
!574 = !DILocation(line: 621, column: 5, scope: !573)
!575 = !DILocalVariable(name: "positive_LowerSat_local", scope: !576, file: !8, line: 622, type: !9)
!576 = distinct !DILexicalBlock(scope: !568, file: !8, line: 621, column: 12)
!577 = !DILocation(line: 622, column: 13, scope: !576)
!578 = !DILocation(line: 623, column: 13, scope: !579)
!579 = distinct !DILexicalBlock(scope: !576, file: !8, line: 623, column: 13)
!580 = !DILocation(line: 623, column: 18, scope: !579)
!581 = !DILocation(line: 623, column: 15, scope: !579)
!582 = !DILocation(line: 623, column: 13, scope: !576)
!583 = !DILocation(line: 624, column: 15, scope: !584)
!584 = distinct !DILexicalBlock(scope: !579, file: !8, line: 623, column: 43)
!585 = !DILocation(line: 625, column: 9, scope: !584)
!586 = !DILocalVariable(name: "tmp0", scope: !528, file: !8, line: 635, type: !9)
!587 = !DILocation(line: 635, column: 9, scope: !528)
!588 = !DILocalVariable(name: "tmp1", scope: !528, file: !8, line: 636, type: !9)
!589 = !DILocation(line: 636, column: 9, scope: !528)
!590 = !DILocation(line: 636, column: 80, scope: !528)
!591 = !DILocation(line: 636, column: 78, scope: !528)
!592 = !DILocation(line: 637, column: 9, scope: !593)
!593 = distinct !DILexicalBlock(scope: !528, file: !8, line: 637, column: 9)
!594 = !DILocation(line: 637, column: 16, scope: !593)
!595 = !DILocation(line: 637, column: 14, scope: !593)
!596 = !DILocation(line: 637, column: 9, scope: !528)
!597 = !DILocation(line: 638, column: 32, scope: !598)
!598 = distinct !DILexicalBlock(scope: !593, file: !8, line: 637, column: 22)
!599 = !DILocation(line: 639, column: 5, scope: !598)
!600 = !DILocation(line: 640, column: 32, scope: !601)
!601 = distinct !DILexicalBlock(scope: !593, file: !8, line: 639, column: 12)
!602 = !DILocalVariable(name: "Threshold_10kmh_Threshold_local", scope: !528, file: !8, line: 645, type: !9)
!603 = !DILocation(line: 645, column: 9, scope: !528)
!604 = !DILocation(line: 646, column: 9, scope: !605)
!605 = distinct !DILexicalBlock(scope: !528, file: !8, line: 646, column: 9)
!606 = !DILocation(line: 646, column: 45, scope: !605)
!607 = !DILocation(line: 646, column: 42, scope: !605)
!608 = !DILocation(line: 646, column: 9, scope: !528)
!609 = !DILocation(line: 651, column: 13, scope: !610)
!610 = distinct !DILexicalBlock(scope: !611, file: !8, line: 651, column: 13)
!611 = distinct !DILexicalBlock(scope: !605, file: !8, line: 646, column: 78)
!612 = !DILocation(line: 651, column: 13, scope: !611)
!613 = !DILocation(line: 652, column: 71, scope: !614)
!614 = distinct !DILexicalBlock(scope: !610, file: !8, line: 651, column: 37)
!615 = !DILocation(line: 653, column: 9, scope: !614)
!616 = !DILocation(line: 654, column: 73, scope: !617)
!617 = distinct !DILexicalBlock(scope: !610, file: !8, line: 653, column: 16)
!618 = !DILocation(line: 654, column: 71, scope: !617)
!619 = !DILocation(line: 658, column: 5, scope: !611)
!620 = !DILocation(line: 661, column: 69, scope: !621)
!621 = distinct !DILexicalBlock(scope: !605, file: !8, line: 658, column: 12)
!622 = !DILocation(line: 661, column: 67, scope: !621)
!623 = !DILocation(line: 672, column: 40, scope: !528)
!624 = !DILocation(line: 672, column: 38, scope: !528)
!625 = !DILocation(line: 675, column: 12, scope: !528)
!626 = !DILocation(line: 675, column: 10, scope: !528)
!627 = !DILocation(line: 676, column: 1, scope: !528)
!628 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !8, file: !8, line: 684, type: !629, scopeLine: 685, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!629 = !DISubroutineType(types: !630)
!630 = !{!9}
!631 = !DILocation(line: 689, column: 10, scope: !628)
!632 = !DILocation(line: 700, column: 5, scope: !628)
