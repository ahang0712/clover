; ModuleID = 'svp_simple_300_001-opt.bc'
source_filename = "./svp_simple_300_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pdev = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @ldv_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !16
  call void @abort() #4, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @isr_ldv_assert(i32 %0) #0 !dbg !20 {
  %2 = icmp ne i32 %0, 0, !dbg !21
  br i1 %2, label %6, label %3, !dbg !22

3:                                                ; preds = %1
  br label %4, !dbg !23

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !24
  call void @abort() #4, !dbg !26
  unreachable, !dbg !26

6:                                                ; preds = %1
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @svp_simple_300_001_isr_1(i8* %0) #0 !dbg !28 {
  store i32 6, i32* @pdev, align 4, !dbg !29, !tbaa !30
  %2 = load i32, i32* @pdev, align 4, !dbg !34, !tbaa !30
  %3 = icmp eq i32 %2, 6, !dbg !35
  %4 = zext i1 %3 to i32, !dbg !35
  br i1 %3, label %isr_ldv_assert.exit, label %5, !dbg !36

5:                                                ; preds = %1
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !38
  call void @abort() #5, !dbg !40
  unreachable, !dbg !40

isr_ldv_assert.exit:                              ; preds = %1
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define i32 @module_init() #0 !dbg !42 {
  store i32 1, i32* @pdev, align 4, !dbg !43, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !44, !tbaa !30
  %2 = icmp eq i32 %1, 1, !dbg !45
  %3 = zext i1 %2 to i32, !dbg !45
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !46

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !48
  call void @abort() #5, !dbg !50
  unreachable, !dbg !50

ldv_assert.exit:                                  ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int(), !dbg !51
  %7 = icmp ne i32 %6, 0, !dbg !51
  br i1 %7, label %8, label %9, !dbg !51

8:                                                ; preds = %ldv_assert.exit
  br label %15, !dbg !52

9:                                                ; preds = %ldv_assert.exit
  store i32 3, i32* @pdev, align 4, !dbg !53, !tbaa !30
  %10 = load i32, i32* @pdev, align 4, !dbg !54, !tbaa !30
  %11 = icmp eq i32 %10, 3, !dbg !55
  %12 = zext i1 %11 to i32, !dbg !55
  br i1 %11, label %ldv_assert.exit1, label %13, !dbg !56

13:                                               ; preds = %9
  %14 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !58
  call void @abort() #5, !dbg !60
  unreachable, !dbg !60

ldv_assert.exit1:                                 ; preds = %9
  br label %15, !dbg !61

15:                                               ; preds = %ldv_assert.exit1, %8
  %.0 = phi i32 [ 0, %8 ], [ -1, %ldv_assert.exit1 ], !dbg !62
  ret i32 %.0, !dbg !63
}

declare i32 @__VERIFIER_nondet_int() #1

; Function Attrs: nounwind uwtable
define void @module_exit() #0 !dbg !64 {
  store i32 5, i32* @pdev, align 4, !dbg !65, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !66, !tbaa !30
  %2 = icmp eq i32 %1, 5, !dbg !67
  %3 = zext i1 %2 to i32, !dbg !67
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !68

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !70
  call void @abort() #5, !dbg !72
  unreachable, !dbg !72

ldv_assert.exit:                                  ; preds = %0
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_300_001_main() #0 !dbg !74 {
  store i32 1, i32* @pdev, align 4, !dbg !75, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !77, !tbaa !30
  %2 = icmp eq i32 %1, 1, !dbg !78
  %3 = zext i1 %2 to i32, !dbg !78
  br i1 %2, label %ldv_assert.exit.i, label %4, !dbg !79

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !81
  call void @abort() #5, !dbg !83
  unreachable, !dbg !83

ldv_assert.exit.i:                                ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int() #3, !dbg !84
  %7 = icmp ne i32 %6, 0, !dbg !84
  br i1 %7, label %8, label %9, !dbg !84

8:                                                ; preds = %ldv_assert.exit.i
  br label %module_init.exit, !dbg !85

9:                                                ; preds = %ldv_assert.exit.i
  store i32 3, i32* @pdev, align 4, !dbg !86, !tbaa !30
  %10 = load i32, i32* @pdev, align 4, !dbg !87, !tbaa !30
  %11 = icmp eq i32 %10, 3, !dbg !88
  %12 = zext i1 %11 to i32, !dbg !88
  br i1 %11, label %ldv_assert.exit1.i, label %13, !dbg !89

13:                                               ; preds = %9
  %14 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !91
  call void @abort() #5, !dbg !93
  unreachable, !dbg !93

ldv_assert.exit1.i:                               ; preds = %9
  br label %module_init.exit, !dbg !94

module_init.exit:                                 ; preds = %8, %ldv_assert.exit1.i
  %.0.i = phi i32 [ 0, %8 ], [ -1, %ldv_assert.exit1.i ], !dbg !95
  %15 = icmp ne i32 %.0.i, 0, !dbg !96
  br i1 %15, label %16, label %22, !dbg !97

16:                                               ; preds = %module_init.exit
  store i32 5, i32* @pdev, align 4, !dbg !98, !tbaa !30
  %17 = load i32, i32* @pdev, align 4, !dbg !100, !tbaa !30
  %18 = icmp eq i32 %17, 5, !dbg !101
  %19 = zext i1 %18 to i32, !dbg !101
  br i1 %18, label %module_exit.exit, label %20, !dbg !102

20:                                               ; preds = %16
  %21 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !104
  call void @abort() #5, !dbg !106
  unreachable, !dbg !106

module_exit.exit:                                 ; preds = %16
  br label %22, !dbg !107

22:                                               ; preds = %module_exit.exit, %module_init.exit
  store i32 5, i32* @pdev, align 4, !dbg !108, !tbaa !30
  %23 = load i32, i32* @pdev, align 4, !dbg !110, !tbaa !30
  %24 = icmp eq i32 %23, 5, !dbg !111
  %25 = zext i1 %24 to i32, !dbg !111
  br i1 %24, label %module_exit.exit3, label %26, !dbg !112

26:                                               ; preds = %22
  %27 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !114
  call void @abort() #5, !dbg !116
  unreachable, !dbg !116

module_exit.exit3:                                ; preds = %22
  store i32 5, i32* @pdev, align 4, !dbg !117, !tbaa !30
  %28 = load i32, i32* @pdev, align 4, !dbg !119, !tbaa !30
  %29 = icmp eq i32 %28, 5, !dbg !120
  %30 = zext i1 %29 to i32, !dbg !120
  br i1 %29, label %module_exit.exit5, label %31, !dbg !121

31:                                               ; preds = %module_exit.exit3
  %32 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !123
  call void @abort() #5, !dbg !125
  unreachable, !dbg !125

module_exit.exit5:                                ; preds = %module_exit.exit3
  ret i32 0, !dbg !126
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_300_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_300_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 3, column: 22, scope: !7)
!11 = !DILocation(line: 3, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "ldv_assert", scope: !8, file: !8, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 5, column: 40, scope: !12)
!14 = !DILocation(line: 5, column: 39, scope: !12)
!15 = !DILocation(line: 5, column: 52, scope: !12)
!16 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 5, column: 62, scope: !12)
!18 = !DILocation(line: 5, column: 76, scope: !12)
!19 = !DILocation(line: 5, column: 88, scope: !12)
!20 = distinct !DISubprogram(name: "isr_ldv_assert", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 6, column: 44, scope: !20)
!22 = !DILocation(line: 6, column: 43, scope: !20)
!23 = !DILocation(line: 6, column: 56, scope: !20)
!24 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !25)
!25 = distinct !DILocation(line: 6, column: 66, scope: !20)
!26 = !DILocation(line: 6, column: 80, scope: !20)
!27 = !DILocation(line: 6, column: 92, scope: !20)
!28 = distinct !DISubprogram(name: "svp_simple_300_001_isr_1", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 11, column: 9, scope: !28)
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C/C++ TBAA"}
!34 = !DILocation(line: 12, column: 19, scope: !28)
!35 = !DILocation(line: 12, column: 23, scope: !28)
!36 = !DILocation(line: 6, column: 43, scope: !20, inlinedAt: !37)
!37 = distinct !DILocation(line: 12, column: 4, scope: !28)
!38 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !39)
!39 = distinct !DILocation(line: 6, column: 66, scope: !20, inlinedAt: !37)
!40 = !DILocation(line: 6, column: 80, scope: !20, inlinedAt: !37)
!41 = !DILocation(line: 13, column: 1, scope: !28)
!42 = distinct !DISubprogram(name: "module_init", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 16, column: 9, scope: !42)
!44 = !DILocation(line: 17, column: 15, scope: !42)
!45 = !DILocation(line: 17, column: 19, scope: !42)
!46 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !47)
!47 = distinct !DILocation(line: 17, column: 4, scope: !42)
!48 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !49)
!49 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !47)
!50 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !47)
!51 = !DILocation(line: 18, column: 7, scope: !42)
!52 = !DILocation(line: 19, column: 7, scope: !42)
!53 = !DILocation(line: 21, column: 9, scope: !42)
!54 = !DILocation(line: 22, column: 15, scope: !42)
!55 = !DILocation(line: 22, column: 19, scope: !42)
!56 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !57)
!57 = distinct !DILocation(line: 22, column: 4, scope: !42)
!58 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !59)
!59 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !57)
!60 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !57)
!61 = !DILocation(line: 23, column: 4, scope: !42)
!62 = !DILocation(line: 0, scope: !42)
!63 = !DILocation(line: 24, column: 1, scope: !42)
!64 = distinct !DISubprogram(name: "module_exit", scope: !8, file: !8, line: 26, type: !9, scopeLine: 26, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 27, column: 9, scope: !64)
!66 = !DILocation(line: 28, column: 15, scope: !64)
!67 = !DILocation(line: 28, column: 19, scope: !64)
!68 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !69)
!69 = distinct !DILocation(line: 28, column: 4, scope: !64)
!70 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !71)
!71 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !69)
!72 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !69)
!73 = !DILocation(line: 29, column: 1, scope: !64)
!74 = distinct !DISubprogram(name: "svp_simple_300_001_main", scope: !8, file: !8, line: 31, type: !9, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 16, column: 9, scope: !42, inlinedAt: !76)
!76 = distinct !DILocation(line: 32, column: 8, scope: !74)
!77 = !DILocation(line: 17, column: 15, scope: !42, inlinedAt: !76)
!78 = !DILocation(line: 17, column: 19, scope: !42, inlinedAt: !76)
!79 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !80)
!80 = distinct !DILocation(line: 17, column: 4, scope: !42, inlinedAt: !76)
!81 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !82)
!82 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !80)
!83 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !80)
!84 = !DILocation(line: 18, column: 7, scope: !42, inlinedAt: !76)
!85 = !DILocation(line: 19, column: 7, scope: !42, inlinedAt: !76)
!86 = !DILocation(line: 21, column: 9, scope: !42, inlinedAt: !76)
!87 = !DILocation(line: 22, column: 15, scope: !42, inlinedAt: !76)
!88 = !DILocation(line: 22, column: 19, scope: !42, inlinedAt: !76)
!89 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !90)
!90 = distinct !DILocation(line: 22, column: 4, scope: !42, inlinedAt: !76)
!91 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !92)
!92 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !90)
!93 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !90)
!94 = !DILocation(line: 23, column: 4, scope: !42, inlinedAt: !76)
!95 = !DILocation(line: 0, scope: !42, inlinedAt: !76)
!96 = !DILocation(line: 32, column: 22, scope: !74)
!97 = !DILocation(line: 32, column: 8, scope: !74)
!98 = !DILocation(line: 27, column: 9, scope: !64, inlinedAt: !99)
!99 = distinct !DILocation(line: 33, column: 7, scope: !74)
!100 = !DILocation(line: 28, column: 15, scope: !64, inlinedAt: !99)
!101 = !DILocation(line: 28, column: 19, scope: !64, inlinedAt: !99)
!102 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !103)
!103 = distinct !DILocation(line: 28, column: 4, scope: !64, inlinedAt: !99)
!104 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !105)
!105 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !103)
!106 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !103)
!107 = !DILocation(line: 34, column: 4, scope: !74)
!108 = !DILocation(line: 27, column: 9, scope: !64, inlinedAt: !109)
!109 = distinct !DILocation(line: 35, column: 5, scope: !74)
!110 = !DILocation(line: 28, column: 15, scope: !64, inlinedAt: !109)
!111 = !DILocation(line: 28, column: 19, scope: !64, inlinedAt: !109)
!112 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !113)
!113 = distinct !DILocation(line: 28, column: 4, scope: !64, inlinedAt: !109)
!114 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !115)
!115 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !113)
!116 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !113)
!117 = !DILocation(line: 27, column: 9, scope: !64, inlinedAt: !118)
!118 = distinct !DILocation(line: 36, column: 5, scope: !74)
!119 = !DILocation(line: 28, column: 15, scope: !64, inlinedAt: !118)
!120 = !DILocation(line: 28, column: 19, scope: !64, inlinedAt: !118)
!121 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !122)
!122 = distinct !DILocation(line: 28, column: 4, scope: !64, inlinedAt: !118)
!123 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !124)
!124 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !122)
!125 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !122)
!126 = !DILocation(line: 37, column: 5, scope: !74)
