; ModuleID = 'svp_simple_600_001.bc'
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
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %7, label %5, !dbg !19

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5
  call void @reach_error(), !dbg !21
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

7:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @isr__VERIFIER_assert(i32 %0) #0 !dbg !24 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !25, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !26
  br i1 %4, label %7, label %5, !dbg !27

5:                                                ; preds = %1
  br label %6, !dbg !28

6:                                                ; preds = %5
  call void @reach_error(), !dbg !29
  call void @abort() #4, !dbg !30
  unreachable, !dbg !30

7:                                                ; preds = %1
  ret void, !dbg !31
}

; Function Attrs: nounwind uwtable
define void @svp_simple_600_001_isr_1(i8* %0) #0 !dbg !32 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !33
  %4 = bitcast i32* %3 to i8*, !dbg !35
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5, !dbg !35
  %5 = load i32, i32* @glob1, align 4, !dbg !36, !tbaa !13
  store i32 %5, i32* %3, align 4, !dbg !37, !tbaa !13
  %6 = load i32, i32* %3, align 4, !dbg !38, !tbaa !13
  %7 = icmp eq i32 %6, 5, !dbg !39
  %8 = zext i1 %7 to i32, !dbg !39
  call void @isr__VERIFIER_assert(i32 %8), !dbg !40
  store i32 -10, i32* @glob1, align 4, !dbg !41, !tbaa !13
  %9 = load i32, i32* @glob1, align 4, !dbg !42, !tbaa !13
  %10 = icmp eq i32 %9, -10, !dbg !43
  %11 = zext i1 %10 to i32, !dbg !43
  %12 = call i32 (i32, ...) bitcast (i32 (...)* @isr_VERIFIER_assert to i32 (i32, ...)*)(i32 %11), !dbg !44
  %13 = load i32, i32* %3, align 4, !dbg !45, !tbaa !13
  store i32 %13, i32* @glob1, align 4, !dbg !46, !tbaa !13
  %14 = bitcast i32* %3 to i8*, !dbg !47
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #5, !dbg !47
  ret void, !dbg !47
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @isr_VERIFIER_assert(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_600_001_main() #0 !dbg !48 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @glob1, align 4, !dbg !49, !tbaa !13
  %4 = icmp eq i32 %3, 5, !dbg !50
  %5 = zext i1 %4 to i32, !dbg !50
  call void @__VERIFIER_assert(i32 %5), !dbg !51
  %6 = bitcast i32* %1 to i8*, !dbg !52
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5, !dbg !52
  %7 = load i32, i32* @glob1, align 4, !dbg !53, !tbaa !13
  %8 = add nsw i32 %7, 1, !dbg !54
  store i32 %8, i32* %1, align 4, !dbg !55, !tbaa !13
  %9 = load i32, i32* %1, align 4, !dbg !56, !tbaa !13
  store i32 %9, i32* @glob1, align 4, !dbg !57, !tbaa !13
  %10 = load i32, i32* @glob1, align 4, !dbg !58, !tbaa !13
  %11 = icmp eq i32 %10, 6, !dbg !59
  %12 = zext i1 %11 to i32, !dbg !59
  call void @__VERIFIER_assert(i32 %12), !dbg !60
  %13 = bitcast i32* %2 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #5, !dbg !61
  %14 = load i32, i32* @glob1, align 4, !dbg !62, !tbaa !13
  %15 = sub nsw i32 %14, 1, !dbg !63
  store i32 %15, i32* %2, align 4, !dbg !64, !tbaa !13
  %16 = load i32, i32* %2, align 4, !dbg !65, !tbaa !13
  store i32 %16, i32* @glob1, align 4, !dbg !66, !tbaa !13
  %17 = bitcast i32* %2 to i8*, !dbg !67
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !67
  %18 = bitcast i32* %1 to i8*, !dbg !67
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #5, !dbg !67
  ret i32 0, !dbg !68
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

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
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 7, column: 9, scope: !12)
!18 = !DILocation(line: 7, column: 8, scope: !12)
!19 = !DILocation(line: 7, column: 7, scope: !12)
!20 = !DILocation(line: 8, column: 3, scope: !12)
!21 = !DILocation(line: 11, column: 5, scope: !12)
!22 = !DILocation(line: 12, column: 5, scope: !12)
!23 = !DILocation(line: 15, column: 1, scope: !12)
!24 = distinct !DISubprogram(name: "isr__VERIFIER_assert", scope: !8, file: !8, line: 18, type: !9, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 20, column: 9, scope: !24)
!26 = !DILocation(line: 20, column: 8, scope: !24)
!27 = !DILocation(line: 20, column: 7, scope: !24)
!28 = !DILocation(line: 21, column: 3, scope: !24)
!29 = !DILocation(line: 24, column: 5, scope: !24)
!30 = !DILocation(line: 25, column: 5, scope: !24)
!31 = !DILocation(line: 28, column: 1, scope: !24)
!32 = distinct !DISubprogram(name: "svp_simple_600_001_isr_1", scope: !8, file: !8, line: 32, type: !9, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !{!34, !34, i64 0}
!34 = !{!"any pointer", !15, i64 0}
!35 = !DILocation(line: 34, column: 3, scope: !32)
!36 = !DILocation(line: 35, column: 7, scope: !32)
!37 = !DILocation(line: 35, column: 5, scope: !32)
!38 = !DILocation(line: 36, column: 24, scope: !32)
!39 = !DILocation(line: 36, column: 26, scope: !32)
!40 = !DILocation(line: 36, column: 3, scope: !32)
!41 = !DILocation(line: 37, column: 9, scope: !32)
!42 = !DILocation(line: 38, column: 23, scope: !32)
!43 = !DILocation(line: 38, column: 29, scope: !32)
!44 = !DILocation(line: 38, column: 3, scope: !32)
!45 = !DILocation(line: 39, column: 11, scope: !32)
!46 = !DILocation(line: 39, column: 9, scope: !32)
!47 = !DILocation(line: 40, column: 1, scope: !32)
!48 = distinct !DISubprogram(name: "svp_simple_600_001_main", scope: !8, file: !8, line: 42, type: !9, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 45, column: 21, scope: !48)
!50 = !DILocation(line: 45, column: 27, scope: !48)
!51 = !DILocation(line: 45, column: 3, scope: !48)
!52 = !DILocation(line: 46, column: 3, scope: !48)
!53 = !DILocation(line: 46, column: 13, scope: !48)
!54 = !DILocation(line: 46, column: 19, scope: !48)
!55 = !DILocation(line: 46, column: 7, scope: !48)
!56 = !DILocation(line: 47, column: 11, scope: !48)
!57 = !DILocation(line: 47, column: 9, scope: !48)
!58 = !DILocation(line: 49, column: 21, scope: !48)
!59 = !DILocation(line: 49, column: 27, scope: !48)
!60 = !DILocation(line: 49, column: 3, scope: !48)
!61 = !DILocation(line: 50, column: 3, scope: !48)
!62 = !DILocation(line: 50, column: 14, scope: !48)
!63 = !DILocation(line: 50, column: 20, scope: !48)
!64 = !DILocation(line: 50, column: 7, scope: !48)
!65 = !DILocation(line: 51, column: 11, scope: !48)
!66 = !DILocation(line: 51, column: 9, scope: !48)
!67 = !DILocation(line: 55, column: 1, scope: !48)
!68 = !DILocation(line: 54, column: 3, scope: !48)
