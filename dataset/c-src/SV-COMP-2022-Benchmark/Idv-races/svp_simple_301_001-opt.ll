; ModuleID = 'svp_simple_301_001-opt.bc'
source_filename = "./svp_simple_301_001.c"
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
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
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
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !24
  call void @abort() #5, !dbg !26
  unreachable, !dbg !26

6:                                                ; preds = %1
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @svp_simple_301_001_isr_1(i8* %0) #0 !dbg !28 {
  store i32 6, i32* @pdev, align 4, !dbg !29, !tbaa !30
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @module_init() #0 !dbg !35 {
  store i32 1, i32* @pdev, align 4, !dbg !36, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !37, !tbaa !30
  %2 = icmp eq i32 %1, 1, !dbg !38
  %3 = zext i1 %2 to i32, !dbg !38
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !39

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !41
  call void @abort() #6, !dbg !43
  unreachable, !dbg !43

ldv_assert.exit:                                  ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int(), !dbg !44
  %7 = icmp ne i32 %6, 0, !dbg !44
  br i1 %7, label %8, label %14, !dbg !44

8:                                                ; preds = %ldv_assert.exit
  store i32 2, i32* @pdev, align 4, !dbg !45, !tbaa !30
  %9 = load i32, i32* @pdev, align 4, !dbg !46, !tbaa !30
  %10 = icmp eq i32 %9, 2, !dbg !47
  %11 = zext i1 %10 to i32, !dbg !47
  br i1 %10, label %ldv_assert.exit1, label %12, !dbg !48

12:                                               ; preds = %8
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !50
  call void @abort() #6, !dbg !52
  unreachable, !dbg !52

ldv_assert.exit1:                                 ; preds = %8
  br label %20, !dbg !53

14:                                               ; preds = %ldv_assert.exit
  store i32 3, i32* @pdev, align 4, !dbg !54, !tbaa !30
  %15 = load i32, i32* @pdev, align 4, !dbg !55, !tbaa !30
  %16 = icmp eq i32 %15, 3, !dbg !56
  %17 = zext i1 %16 to i32, !dbg !56
  br i1 %16, label %ldv_assert.exit2, label %18, !dbg !57

18:                                               ; preds = %14
  %19 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !59
  call void @abort() #6, !dbg !61
  unreachable, !dbg !61

ldv_assert.exit2:                                 ; preds = %14
  br label %20, !dbg !62

20:                                               ; preds = %ldv_assert.exit2, %ldv_assert.exit1
  %.0 = phi i32 [ 0, %ldv_assert.exit1 ], [ -1, %ldv_assert.exit2 ], !dbg !63
  ret i32 %.0, !dbg !64
}

declare i32 @__VERIFIER_nondet_int() #1

; Function Attrs: nounwind uwtable
define void @module_exit() #0 !dbg !65 {
  store i32 5, i32* @pdev, align 4, !dbg !66, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !67, !tbaa !30
  %2 = icmp eq i32 %1, 5, !dbg !68
  %3 = zext i1 %2 to i32, !dbg !68
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !69

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !71
  call void @abort() #6, !dbg !73
  unreachable, !dbg !73

ldv_assert.exit:                                  ; preds = %0
  ret void, !dbg !74
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_301_001_main() #0 !dbg !75 {
  store i32 1, i32* @pdev, align 4, !dbg !76, !tbaa !30
  %1 = load i32, i32* @pdev, align 4, !dbg !78, !tbaa !30
  %2 = icmp eq i32 %1, 1, !dbg !79
  %3 = zext i1 %2 to i32, !dbg !79
  br i1 %2, label %ldv_assert.exit.i, label %4, !dbg !80

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !82
  call void @abort() #6, !dbg !84
  unreachable, !dbg !84

ldv_assert.exit.i:                                ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int() #4, !dbg !85
  %7 = icmp ne i32 %6, 0, !dbg !85
  br i1 %7, label %8, label %14, !dbg !85

8:                                                ; preds = %ldv_assert.exit.i
  store i32 2, i32* @pdev, align 4, !dbg !86, !tbaa !30
  %9 = load i32, i32* @pdev, align 4, !dbg !87, !tbaa !30
  %10 = icmp eq i32 %9, 2, !dbg !88
  %11 = zext i1 %10 to i32, !dbg !88
  br i1 %10, label %ldv_assert.exit1.i, label %12, !dbg !89

12:                                               ; preds = %8
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !91
  call void @abort() #6, !dbg !93
  unreachable, !dbg !93

ldv_assert.exit1.i:                               ; preds = %8
  br label %module_init.exit, !dbg !94

14:                                               ; preds = %ldv_assert.exit.i
  store i32 3, i32* @pdev, align 4, !dbg !95, !tbaa !30
  %15 = load i32, i32* @pdev, align 4, !dbg !96, !tbaa !30
  %16 = icmp eq i32 %15, 3, !dbg !97
  %17 = zext i1 %16 to i32, !dbg !97
  br i1 %16, label %ldv_assert.exit2.i, label %18, !dbg !98

18:                                               ; preds = %14
  %19 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !100
  call void @abort() #6, !dbg !102
  unreachable, !dbg !102

ldv_assert.exit2.i:                               ; preds = %14
  br label %module_init.exit, !dbg !103

module_init.exit:                                 ; preds = %ldv_assert.exit1.i, %ldv_assert.exit2.i
  %.0.i = phi i32 [ 0, %ldv_assert.exit1.i ], [ -1, %ldv_assert.exit2.i ], !dbg !104
  %20 = icmp ne i32 %.0.i, 0, !dbg !105
  br i1 %20, label %21, label %22, !dbg !106

21:                                               ; preds = %module_init.exit
  br label %22, !dbg !107

22:                                               ; preds = %21, %module_init.exit
  store i32 5, i32* @pdev, align 4, !dbg !108, !tbaa !30
  %23 = load i32, i32* @pdev, align 4, !dbg !110, !tbaa !30
  %24 = icmp eq i32 %23, 5, !dbg !111
  %25 = zext i1 %24 to i32, !dbg !111
  br i1 %24, label %module_exit.exit, label %26, !dbg !112

26:                                               ; preds = %22
  %27 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !114
  call void @abort() #6, !dbg !116
  unreachable, !dbg !116

module_exit.exit:                                 ; preds = %22
  store i32 5, i32* @pdev, align 4, !dbg !117, !tbaa !30
  %28 = load i32, i32* @pdev, align 4, !dbg !119, !tbaa !30
  %29 = icmp eq i32 %28, 5, !dbg !120
  %30 = zext i1 %29 to i32, !dbg !120
  br i1 %29, label %module_exit.exit3, label %31, !dbg !121

31:                                               ; preds = %module_exit.exit
  %32 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !123
  call void @abort() #6, !dbg !125
  unreachable, !dbg !125

module_exit.exit3:                                ; preds = %module_exit.exit
  ret i32 0, !dbg !126
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_301_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_301_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 22, scope: !7)
!11 = !DILocation(line: 4, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "ldv_assert", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 6, column: 40, scope: !12)
!14 = !DILocation(line: 6, column: 39, scope: !12)
!15 = !DILocation(line: 6, column: 52, scope: !12)
!16 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 6, column: 62, scope: !12)
!18 = !DILocation(line: 6, column: 76, scope: !12)
!19 = !DILocation(line: 6, column: 88, scope: !12)
!20 = distinct !DISubprogram(name: "isr_ldv_assert", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 7, column: 44, scope: !20)
!22 = !DILocation(line: 7, column: 43, scope: !20)
!23 = !DILocation(line: 7, column: 56, scope: !20)
!24 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !25)
!25 = distinct !DILocation(line: 7, column: 66, scope: !20)
!26 = !DILocation(line: 7, column: 80, scope: !20)
!27 = !DILocation(line: 7, column: 92, scope: !20)
!28 = distinct !DISubprogram(name: "svp_simple_301_001_isr_1", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 12, column: 9, scope: !28)
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C/C++ TBAA"}
!34 = !DILocation(line: 13, column: 1, scope: !28)
!35 = distinct !DISubprogram(name: "module_init", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 16, column: 9, scope: !35)
!37 = !DILocation(line: 17, column: 15, scope: !35)
!38 = !DILocation(line: 17, column: 19, scope: !35)
!39 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !40)
!40 = distinct !DILocation(line: 17, column: 4, scope: !35)
!41 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !42)
!42 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !40)
!43 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !40)
!44 = !DILocation(line: 18, column: 7, scope: !35)
!45 = !DILocation(line: 19, column: 12, scope: !35)
!46 = !DILocation(line: 20, column: 18, scope: !35)
!47 = !DILocation(line: 20, column: 22, scope: !35)
!48 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !49)
!49 = distinct !DILocation(line: 20, column: 7, scope: !35)
!50 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !51)
!51 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !49)
!52 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !49)
!53 = !DILocation(line: 21, column: 7, scope: !35)
!54 = !DILocation(line: 23, column: 9, scope: !35)
!55 = !DILocation(line: 24, column: 15, scope: !35)
!56 = !DILocation(line: 24, column: 19, scope: !35)
!57 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !58)
!58 = distinct !DILocation(line: 24, column: 4, scope: !35)
!59 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !60)
!60 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !58)
!61 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !58)
!62 = !DILocation(line: 25, column: 4, scope: !35)
!63 = !DILocation(line: 0, scope: !35)
!64 = !DILocation(line: 26, column: 1, scope: !35)
!65 = distinct !DISubprogram(name: "module_exit", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 30, column: 9, scope: !65)
!67 = !DILocation(line: 31, column: 15, scope: !65)
!68 = !DILocation(line: 31, column: 19, scope: !65)
!69 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !70)
!70 = distinct !DILocation(line: 31, column: 4, scope: !65)
!71 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !72)
!72 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !70)
!73 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !70)
!74 = !DILocation(line: 32, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "svp_simple_301_001_main", scope: !8, file: !8, line: 34, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 16, column: 9, scope: !35, inlinedAt: !77)
!77 = distinct !DILocation(line: 35, column: 8, scope: !75)
!78 = !DILocation(line: 17, column: 15, scope: !35, inlinedAt: !77)
!79 = !DILocation(line: 17, column: 19, scope: !35, inlinedAt: !77)
!80 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !81)
!81 = distinct !DILocation(line: 17, column: 4, scope: !35, inlinedAt: !77)
!82 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !83)
!83 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !81)
!84 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !81)
!85 = !DILocation(line: 18, column: 7, scope: !35, inlinedAt: !77)
!86 = !DILocation(line: 19, column: 12, scope: !35, inlinedAt: !77)
!87 = !DILocation(line: 20, column: 18, scope: !35, inlinedAt: !77)
!88 = !DILocation(line: 20, column: 22, scope: !35, inlinedAt: !77)
!89 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !90)
!90 = distinct !DILocation(line: 20, column: 7, scope: !35, inlinedAt: !77)
!91 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !92)
!92 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !90)
!93 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !90)
!94 = !DILocation(line: 21, column: 7, scope: !35, inlinedAt: !77)
!95 = !DILocation(line: 23, column: 9, scope: !35, inlinedAt: !77)
!96 = !DILocation(line: 24, column: 15, scope: !35, inlinedAt: !77)
!97 = !DILocation(line: 24, column: 19, scope: !35, inlinedAt: !77)
!98 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !99)
!99 = distinct !DILocation(line: 24, column: 4, scope: !35, inlinedAt: !77)
!100 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !101)
!101 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !99)
!102 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !99)
!103 = !DILocation(line: 25, column: 4, scope: !35, inlinedAt: !77)
!104 = !DILocation(line: 0, scope: !35, inlinedAt: !77)
!105 = !DILocation(line: 35, column: 22, scope: !75)
!106 = !DILocation(line: 35, column: 8, scope: !75)
!107 = !DILocation(line: 38, column: 4, scope: !75)
!108 = !DILocation(line: 30, column: 9, scope: !65, inlinedAt: !109)
!109 = distinct !DILocation(line: 40, column: 5, scope: !75)
!110 = !DILocation(line: 31, column: 15, scope: !65, inlinedAt: !109)
!111 = !DILocation(line: 31, column: 19, scope: !65, inlinedAt: !109)
!112 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !113)
!113 = distinct !DILocation(line: 31, column: 4, scope: !65, inlinedAt: !109)
!114 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !115)
!115 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !113)
!116 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !113)
!117 = !DILocation(line: 30, column: 9, scope: !65, inlinedAt: !118)
!118 = distinct !DILocation(line: 41, column: 5, scope: !75)
!119 = !DILocation(line: 31, column: 15, scope: !65, inlinedAt: !118)
!120 = !DILocation(line: 31, column: 19, scope: !65, inlinedAt: !118)
!121 = !DILocation(line: 6, column: 39, scope: !12, inlinedAt: !122)
!122 = distinct !DILocation(line: 31, column: 4, scope: !65, inlinedAt: !118)
!123 = !DILocation(line: 4, column: 22, scope: !7, inlinedAt: !124)
!124 = distinct !DILocation(line: 6, column: 62, scope: !12, inlinedAt: !122)
!125 = !DILocation(line: 6, column: 76, scope: !12, inlinedAt: !122)
!126 = !DILocation(line: 42, column: 5, scope: !75)
