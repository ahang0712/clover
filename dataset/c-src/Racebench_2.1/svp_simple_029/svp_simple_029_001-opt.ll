; ModuleID = 'svp_simple_029_001-opt.bc'
source_filename = "./svp_simple_029_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_029_001_ptr_SetSelfCtrlFlag = common global void (i32, i8, i8)* null, align 8
@svp_simple_029_001_average_adjust_flag = common global i8 0, align 1
@svp_simple_029_001_ptr_SetTmData = common global void (i32, i8)* null, align 8
@svp_simple_029_001_ptr_GetTmData = common global i8 (i32)* null, align 8
@svp_simple_029_001_tm_blocks = common global [4096 x i8] zeroinitializer, align 16
@svp_simple_029_001_average_adjust_count = common global i8 0, align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_main() #0 !dbg !7 {
  br label %1, !dbg !10

1:                                                ; preds = %3, %0
  %.0.i = phi i32 [ 0, %0 ], [ %4, %3 ], !dbg !13
  %2 = icmp slt i32 %.0.i, 4096, !dbg !14
  br i1 %2, label %3, label %svp_simple_029_001_init.exit, !dbg !15

3:                                                ; preds = %1
  %4 = add nsw i32 %.0.i, 1, !dbg !16
  br label %1, !dbg !15, !llvm.loop !17

svp_simple_029_001_init.exit:                     ; preds = %1
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !19, !tbaa !20
  call void (...) @init() #3, !dbg !23
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !24, !tbaa !27
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !29, !tbaa !27
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !30, !tbaa !27
  br i1 true, label %5, label %7, !dbg !31

5:                                                ; preds = %svp_simple_029_001_init.exit
  %6 = load void (i32, i8, i8)*, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !32, !tbaa !27
  call void %6(i32 36, i8 zeroext -1, i8 zeroext 0), !dbg !32
  br label %7, !dbg !33

7:                                                ; preds = %5, %svp_simple_029_001_init.exit
  ret void, !dbg !34
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_init() #0 !dbg !11 {
  br label %1, !dbg !35

1:                                                ; preds = %5, %0
  %.0 = phi i32 [ 0, %0 ], [ %6, %5 ], !dbg !36
  %2 = icmp slt i32 %.0, 4096, !dbg !37
  br i1 %2, label %4, label %3, !dbg !38

3:                                                ; preds = %1
  br label %7

4:                                                ; preds = %1
  br label %5, !dbg !39

5:                                                ; preds = %4
  %6 = add nsw i32 %.0, 1, !dbg !40
  br label %1, !dbg !38, !llvm.loop !41

7:                                                ; preds = %3
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !42, !tbaa !20
  call void (...) @init(), !dbg !43
  ret void, !dbg !44
}

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_TmOrgFuncMap() #0 !dbg !25 {
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !45, !tbaa !27
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !46, !tbaa !27
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !47, !tbaa !27
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetTmData(i32 %0, i8 zeroext %1) #0 !dbg !49 {
  %3 = zext i32 %0 to i64, !dbg !50
  %4 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %3, !dbg !50
  store volatile i8 %1, i8* %4, align 1, !dbg !51, !tbaa !20
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define zeroext i8 @svp_simple_029_001_GetTmData(i32 %0) #0 !dbg !53 {
  %2 = zext i32 %0 to i64, !dbg !54
  %3 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %2, !dbg !54
  %4 = load volatile i8, i8* %3, align 1, !dbg !54, !tbaa !20
  ret i8 %4, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetSelfCtrlFlag(i32 %0, i8 zeroext %1, i8 zeroext %2) #0 !dbg !56 {
  %4 = zext i8 %1 to i32, !dbg !57
  %5 = icmp sgt i32 %4, 128, !dbg !58
  br i1 %5, label %6, label %7, !dbg !57

6:                                                ; preds = %3
  br label %8, !dbg !59

7:                                                ; preds = %3
  br label %8

8:                                                ; preds = %7, %6
  %.0 = phi i8 [ 1, %6 ], [ 0, %7 ], !dbg !60
  %9 = zext i8 %2 to i32, !dbg !61
  %10 = zext i8 %.0 to i32, !dbg !62
  %11 = shl i32 %10, %9, !dbg !62
  %12 = trunc i32 %11 to i8, !dbg !62
  %13 = trunc i32 undef to i8, !dbg !63
  %14 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !64, !tbaa !27
  %15 = call zeroext i8 %14(i32 %0), !dbg !64
  %16 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !65, !tbaa !27
  %17 = add i32 %0, 1, !dbg !66
  %18 = call zeroext i8 %16(i32 %17), !dbg !65
  %19 = zext i8 %18 to i32, !dbg !65
  %20 = zext i8 %15 to i32, !dbg !67
  %21 = add nsw i32 %20, %19, !dbg !67
  %22 = trunc i32 %21 to i8, !dbg !67
  %23 = zext i8 %12 to i32, !dbg !68
  %24 = zext i8 %22 to i32, !dbg !69
  %25 = or i32 %24, %23, !dbg !69
  %26 = trunc i32 %25 to i8, !dbg !69
  %27 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !70, !tbaa !27
  call void %27(i32 %0, i8 zeroext %26), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_isr_1() #0 !dbg !72 {
  %1 = load volatile i8, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !73, !tbaa !20
  %2 = zext i8 %1 to i32, !dbg !73
  %3 = icmp eq i32 %2, 255, !dbg !74
  br i1 %3, label %4, label %9, !dbg !73

4:                                                ; preds = %0
  %5 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !75, !tbaa !20
  %6 = add i8 %5, 1, !dbg !75
  store volatile i8 %6, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !75, !tbaa !20
  %7 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !76, !tbaa !27
  %8 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !77, !tbaa !20
  call void %7(i32 36, i8 zeroext %8), !dbg !76
  br label %12, !dbg !78

9:                                                ; preds = %0
  store volatile i8 0, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !79, !tbaa !20
  %10 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !80, !tbaa !27
  %11 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !81, !tbaa !20
  call void %10(i32 36, i8 zeroext %11), !dbg !80
  br label %12

12:                                               ; preds = %9, %4
  ret void, !dbg !82
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_029")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_029_001_main", scope: !8, file: !8, line: 19, type: !9, scopeLine: 19, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_029")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 29, column: 8, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_029_001_init", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 21, column: 3, scope: !7)
!13 = !DILocation(line: 0, scope: !11, inlinedAt: !12)
!14 = !DILocation(line: 29, column: 21, scope: !11, inlinedAt: !12)
!15 = !DILocation(line: 29, column: 3, scope: !11, inlinedAt: !12)
!16 = !DILocation(line: 29, column: 30, scope: !11, inlinedAt: !12)
!17 = distinct !{!17, !15, !18}
!18 = !DILocation(line: 31, column: 3, scope: !11, inlinedAt: !12)
!19 = !DILocation(line: 32, column: 42, scope: !11, inlinedAt: !12)
!20 = !{!21, !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C/C++ TBAA"}
!23 = !DILocation(line: 34, column: 3, scope: !11, inlinedAt: !12)
!24 = !DILocation(line: 38, column: 36, scope: !25, inlinedAt: !26)
!25 = distinct !DISubprogram(name: "svp_simple_029_001_TmOrgFuncMap", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = distinct !DILocation(line: 22, column: 3, scope: !7)
!27 = !{!28, !28, i64 0}
!28 = !{!"any pointer", !21, i64 0}
!29 = !DILocation(line: 39, column: 36, scope: !25, inlinedAt: !26)
!30 = !DILocation(line: 40, column: 42, scope: !25, inlinedAt: !26)
!31 = !DILocation(line: 24, column: 7, scope: !7)
!32 = !DILocation(line: 25, column: 5, scope: !7)
!33 = !DILocation(line: 26, column: 3, scope: !7)
!34 = !DILocation(line: 27, column: 1, scope: !7)
!35 = !DILocation(line: 29, column: 8, scope: !11)
!36 = !DILocation(line: 0, scope: !11)
!37 = !DILocation(line: 29, column: 21, scope: !11)
!38 = !DILocation(line: 29, column: 3, scope: !11)
!39 = !DILocation(line: 31, column: 3, scope: !11)
!40 = !DILocation(line: 29, column: 30, scope: !11)
!41 = distinct !{!41, !38, !39}
!42 = !DILocation(line: 32, column: 42, scope: !11)
!43 = !DILocation(line: 34, column: 3, scope: !11)
!44 = !DILocation(line: 35, column: 1, scope: !11)
!45 = !DILocation(line: 38, column: 36, scope: !25)
!46 = !DILocation(line: 39, column: 36, scope: !25)
!47 = !DILocation(line: 40, column: 42, scope: !25)
!48 = !DILocation(line: 41, column: 1, scope: !25)
!49 = distinct !DISubprogram(name: "svp_simple_029_001_SetTmData", scope: !8, file: !8, line: 67, type: !9, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 68, column: 3, scope: !49)
!51 = !DILocation(line: 68, column: 41, scope: !49)
!52 = !DILocation(line: 69, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "svp_simple_029_001_GetTmData", scope: !8, file: !8, line: 64, type: !9, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 65, column: 10, scope: !53)
!55 = !DILocation(line: 65, column: 3, scope: !53)
!56 = distinct !DISubprogram(name: "svp_simple_029_001_SetSelfCtrlFlag", scope: !8, file: !8, line: 42, type: !9, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 48, column: 7, scope: !56)
!58 = !DILocation(line: 48, column: 17, scope: !56)
!59 = !DILocation(line: 50, column: 3, scope: !56)
!60 = !DILocation(line: 0, scope: !56)
!61 = !DILocation(line: 54, column: 12, scope: !56)
!62 = !DILocation(line: 54, column: 8, scope: !56)
!63 = !DILocation(line: 56, column: 8, scope: !56)
!64 = !DILocation(line: 58, column: 14, scope: !56)
!65 = !DILocation(line: 59, column: 15, scope: !56)
!66 = !DILocation(line: 59, column: 56, scope: !56)
!67 = !DILocation(line: 59, column: 12, scope: !56)
!68 = !DILocation(line: 60, column: 15, scope: !56)
!69 = !DILocation(line: 60, column: 12, scope: !56)
!70 = !DILocation(line: 62, column: 3, scope: !56)
!71 = !DILocation(line: 63, column: 1, scope: !56)
!72 = distinct !DISubprogram(name: "svp_simple_029_001_isr_1", scope: !8, file: !8, line: 71, type: !9, scopeLine: 71, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 72, column: 7, scope: !72)
!74 = !DILocation(line: 72, column: 46, scope: !72)
!75 = !DILocation(line: 73, column: 44, scope: !72)
!76 = !DILocation(line: 74, column: 5, scope: !72)
!77 = !DILocation(line: 75, column: 13, scope: !72)
!78 = !DILocation(line: 76, column: 3, scope: !72)
!79 = !DILocation(line: 77, column: 45, scope: !72)
!80 = !DILocation(line: 78, column: 5, scope: !72)
!81 = !DILocation(line: 78, column: 42, scope: !72)
!82 = !DILocation(line: 80, column: 1, scope: !72)
