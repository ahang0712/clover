; ModuleID = 'svp_simple_600_001-opt.bc'
source_filename = "./svp_simple_600_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob1 = global i32 5, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
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
define void @isr__VERIFIER_assert(i32 %0) #0 !dbg !20 {
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
define void @svp_simple_600_001_isr_1(i8* %0) #0 !dbg !28 {
  %2 = load i32, i32* @glob1, align 4, !dbg !29, !tbaa !30
  %3 = icmp eq i32 %2, 5, !dbg !34
  %4 = zext i1 %3 to i32, !dbg !34
  br i1 %3, label %isr__VERIFIER_assert.exit, label %5, !dbg !35

5:                                                ; preds = %1
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !37
  call void @abort() #6, !dbg !39
  unreachable, !dbg !39

isr__VERIFIER_assert.exit:                        ; preds = %1
  store i32 -10, i32* @glob1, align 4, !dbg !40, !tbaa !30
  %7 = load i32, i32* @glob1, align 4, !dbg !41, !tbaa !30
  %8 = icmp eq i32 %7, -10, !dbg !42
  %9 = zext i1 %8 to i32, !dbg !42
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @isr_VERIFIER_assert to i32 (i32, ...)*)(i32 %9), !dbg !43
  store i32 %2, i32* @glob1, align 4, !dbg !44, !tbaa !30
  ret void, !dbg !45
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @isr_VERIFIER_assert(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_600_001_main() #0 !dbg !46 {
  %1 = load i32, i32* @glob1, align 4, !dbg !47, !tbaa !30
  %2 = icmp eq i32 %1, 5, !dbg !48
  %3 = zext i1 %2 to i32, !dbg !48
  br i1 %2, label %__VERIFIER_assert.exit, label %4, !dbg !49

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !51
  call void @abort() #6, !dbg !53
  unreachable, !dbg !53

__VERIFIER_assert.exit:                           ; preds = %0
  %6 = load i32, i32* @glob1, align 4, !dbg !54, !tbaa !30
  %7 = add nsw i32 %6, 1, !dbg !55
  store i32 %7, i32* @glob1, align 4, !dbg !56, !tbaa !30
  %8 = load i32, i32* @glob1, align 4, !dbg !57, !tbaa !30
  %9 = icmp eq i32 %8, 6, !dbg !58
  %10 = zext i1 %9 to i32, !dbg !58
  br i1 %9, label %__VERIFIER_assert.exit1, label %11, !dbg !59

11:                                               ; preds = %__VERIFIER_assert.exit
  %12 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !61
  call void @abort() #6, !dbg !63
  unreachable, !dbg !63

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %13 = load i32, i32* @glob1, align 4, !dbg !64, !tbaa !30
  %14 = sub nsw i32 %13, 1, !dbg !65
  store i32 %14, i32* @glob1, align 4, !dbg !66, !tbaa !30
  ret i32 0, !dbg !67
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
!1 = !DIFile(filename: "svp_simple_600_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_600_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 5, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 7, column: 8, scope: !12)
!14 = !DILocation(line: 7, column: 7, scope: !12)
!15 = !DILocation(line: 8, column: 3, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 11, column: 5, scope: !12)
!18 = !DILocation(line: 12, column: 5, scope: !12)
!19 = !DILocation(line: 15, column: 1, scope: !12)
!20 = distinct !DISubprogram(name: "isr__VERIFIER_assert", scope: !8, file: !8, line: 18, type: !9, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 20, column: 8, scope: !20)
!22 = !DILocation(line: 20, column: 7, scope: !20)
!23 = !DILocation(line: 21, column: 3, scope: !20)
!24 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !25)
!25 = distinct !DILocation(line: 24, column: 5, scope: !20)
!26 = !DILocation(line: 25, column: 5, scope: !20)
!27 = !DILocation(line: 28, column: 1, scope: !20)
!28 = distinct !DISubprogram(name: "svp_simple_600_001_isr_1", scope: !8, file: !8, line: 32, type: !9, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 35, column: 7, scope: !28)
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C/C++ TBAA"}
!34 = !DILocation(line: 36, column: 26, scope: !28)
!35 = !DILocation(line: 20, column: 7, scope: !20, inlinedAt: !36)
!36 = distinct !DILocation(line: 36, column: 3, scope: !28)
!37 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !38)
!38 = distinct !DILocation(line: 24, column: 5, scope: !20, inlinedAt: !36)
!39 = !DILocation(line: 25, column: 5, scope: !20, inlinedAt: !36)
!40 = !DILocation(line: 37, column: 9, scope: !28)
!41 = !DILocation(line: 38, column: 23, scope: !28)
!42 = !DILocation(line: 38, column: 29, scope: !28)
!43 = !DILocation(line: 38, column: 3, scope: !28)
!44 = !DILocation(line: 39, column: 9, scope: !28)
!45 = !DILocation(line: 40, column: 1, scope: !28)
!46 = distinct !DISubprogram(name: "svp_simple_600_001_main", scope: !8, file: !8, line: 42, type: !9, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 45, column: 21, scope: !46)
!48 = !DILocation(line: 45, column: 27, scope: !46)
!49 = !DILocation(line: 7, column: 7, scope: !12, inlinedAt: !50)
!50 = distinct !DILocation(line: 45, column: 3, scope: !46)
!51 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !52)
!52 = distinct !DILocation(line: 11, column: 5, scope: !12, inlinedAt: !50)
!53 = !DILocation(line: 12, column: 5, scope: !12, inlinedAt: !50)
!54 = !DILocation(line: 46, column: 13, scope: !46)
!55 = !DILocation(line: 46, column: 19, scope: !46)
!56 = !DILocation(line: 47, column: 9, scope: !46)
!57 = !DILocation(line: 49, column: 21, scope: !46)
!58 = !DILocation(line: 49, column: 27, scope: !46)
!59 = !DILocation(line: 7, column: 7, scope: !12, inlinedAt: !60)
!60 = distinct !DILocation(line: 49, column: 3, scope: !46)
!61 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !62)
!62 = distinct !DILocation(line: 11, column: 5, scope: !12, inlinedAt: !60)
!63 = !DILocation(line: 12, column: 5, scope: !12, inlinedAt: !60)
!64 = !DILocation(line: 50, column: 14, scope: !46)
!65 = !DILocation(line: 50, column: 20, scope: !46)
!66 = !DILocation(line: 51, column: 9, scope: !46)
!67 = !DILocation(line: 54, column: 3, scope: !46)
